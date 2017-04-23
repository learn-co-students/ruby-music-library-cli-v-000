require 'pry'
class Song
  attr_accessor :name
  attr_reader :genre, :artist
  @@all = []
  def initialize(name,artist=nil,genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    genre.add_song(self) unless @genre == nil
    artist.add_song(self) unless @artist == nil
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
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

end
