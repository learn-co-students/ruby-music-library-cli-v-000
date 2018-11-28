require 'pry'
class Song
  @@all = []
  attr_accessor :name, :artist
  
  def initialize(name, artist="", genre="")
    @name = name
    @artist=artist
    @genre=genre
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
  
  def self.create(song)
    new_song = Song.new(song)
    new_song.save
    new_song
  end
  
  def artist=(artist)
  end
  
  def artist(song)
    song.artist
  end
end