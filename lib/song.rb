require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  
 
  @@all= []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end 
    
    if genre != nil
      self.genre = genre
    end
  end  
  
  def self.all
    @@all
  end  
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
    self
  end  
  
  def self.create(song)
    song = self.new(song)
    song.save
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end  
  
  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end 
  
  
  
  def self.find_or_create_by_name(song)
     if find_by_name(song)
      find_by_name(song)
    else 
      create(song)
    end
  end  
  
    # def self.find_by_name(name)
    #     @@all.find {|a| a.name == name}
    #   end
  
  
end