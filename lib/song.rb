require 'pry'
class Song

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end


  def genre
    self.genre
  end



  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name, artist = nil, genre = nil)
    new_song = self.new(name, artist, genre)
    new_song.save
    new_song
  end

end
