require 'pry'



class Song 
 
 attr_accessor :name, :genre
 
 
 @@all = [] 
 
  def initialize(name, artist = nil, genre = nil) 
    @name = name 
    if artist != nil
      self.artist = artist
    end
    if genre != nil 
      self.genre = genre
    end
  end
  
  def artist 
    @artist
  end
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
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
  
  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
    genre.songs << self
    end
  end
  
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