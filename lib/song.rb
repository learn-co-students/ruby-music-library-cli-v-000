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
<<<<<<< HEAD
=======
  self.artist=artist
  
>>>>>>> 428ee27f3d42566f0cec110e0ac3d91086260fa1
  end
  
  def artist(song)
    song.artist
  end
end