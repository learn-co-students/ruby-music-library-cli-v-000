require 'pry'



class Song 
 
 attr_accessor :name
 
 
 @@all = [] 
 
  def initialize(name, artist = nil, genre = nil) 
    @name = name 
    self.artist = artist
  end 
  
  def artist=(artist)
    self.artist = artist 
    artist.songs << self 
  end
    
  
  def genre=(genre)
    self.genre = genre 
  end
    
  
  def self.all 
   @@all 
  end 
  
  def save 
    @@all << self 
  end
  
  def self.destroy_all 
    self.all.clear
  end
  
  def self.create(name) 
    self.new(name).tap {|song| song.save}
    self
  end
  
  #def genre
    #self.genre = genre
  #end
  
  def find_by_name(name) 
    self.all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.all.find{|song| song.name == name} == nil
      song = Song.create(name) 
    else self.all.find{|song| song.name == name}
    end
  end
    
end