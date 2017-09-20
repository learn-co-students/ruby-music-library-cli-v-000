require 'pry'

class Song

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist
    self.genre = genre
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

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.nil?
  end

  def genre=(genre)
    @genre = genre
    unless genre.nil? || genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.new_from_filename(file_name)
    data   = file_name.split(" - ")

    song_name   = data[1]
    artist_name = data[0]
    artist      = Artist.find_or_create_by_name(artist_name)
    genre_name  = data[2].gsub(".mp3", "")
    genre       = Genre.find_or_create_by_name(genre_name)

    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(file_name)
    data = file_name.split(" - ")

    song = self.create(data[1])

    artist_name = data[0]
    song.artist = Artist.find_or_create_by_name(artist_name)
    genre_name  = data[2].gsub(".mp3", "")
    song.genre  = Genre.find_or_create_by_name(genre_name)
    song
  end

end
