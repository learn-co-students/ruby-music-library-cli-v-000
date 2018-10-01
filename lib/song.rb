require 'pry'
class Song
  extend Concerns::Findable
    attr_accessor :name, :artist, :genre #song belongs artist and genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
     self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
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
      split_song = filename.split(" - ")
      song = split_song[1]
      artist = split_song[0]
      genre = split_song[2].split(".")[0]
      artist = Artist.find_or_create_by_name(artist)
      genre = Genre.find_or_create_by_name(genre)
      new(song, artist, genre)
  end

  def self.create_from_filename(filename)
      @@all << Song.new_from_filename(filename)
  end
end