require 'pry'

class Song 
  attr_accessor :name, :genre  
  attr_reader :artist
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @genre = genre 
    @artist = artist  
    
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    self.new(name).tap { |s| s.save }
    #new_instance = self.new(name)
    #new_instance.save
    #new_instance
  end
  
  def save
  @@all << self
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