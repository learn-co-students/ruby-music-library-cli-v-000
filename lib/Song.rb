class Song 

attr_accessor :name, :artist 
@@all = []


  def initialize(name, artist= nil)
    @name = name 
    self.artist=(artist) if artist != nil
  end 

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
 

def save
  @@all << self 
end 

def self.all
  @@all
end 

def self.destroy_all
  @@all.clear 
end 

def self.create(name)
    new_song = Song.new(name)
    @@all << new_song
    new_song 
end 

  
end 

