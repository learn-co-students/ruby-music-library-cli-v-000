require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil , genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    self.save
  end


  def self.create(name, artist = nil, genre = nil)
    self.new(name, artist, genre)
  end

  def genre=(genre)
    @genre = genre
    unless genre.songs.detect { |x| x == self }
      genre.songs << self
    end

  end


  def artist=(artist_name)
    @artist = artist_name
    artist.add_song(self)
  end

  def self.new_from_filename(file)
    parsed = file.split(" - ")
    song_name, artist_name, genre_name = parsed[1], parsed[0], parsed[2].gsub!(/\.\w+/, '')
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new(song_name, artist, genre)
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end
end
