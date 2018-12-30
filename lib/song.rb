require 'pry'

class Song 
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new(name).save
    self
  end
  
  def save
    self.class.all << self
  end
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist = artist
      artist=(artist)
    end
    if genre != nil
      self.genre = genre
      genre=(genre)
     end
  end
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    @genre.songs << self unless @genre.songs.include?(self)
  end
  
  
  
end