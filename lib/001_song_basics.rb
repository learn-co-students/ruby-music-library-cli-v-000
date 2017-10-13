require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = self.artist
    @genre = self.genre
    self.artist = artist if artist
    self.genre = genre if genre
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
    self.new(name).tap{|song| song.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    artist_name, song_name, genre_name = filename.split(' - ')
    genre_name = genre_name.split('.').first

    song = self.new(
      song_name, Artist.find_or_create_by_name(artist_name),
      Genre.find_or_create_by_name(genre_name)
    )

    song
  end

  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end

end
