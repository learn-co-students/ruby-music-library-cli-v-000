class Song 
  
  attr_accessor :name, :artist
  
  def initialize(name, artist = nil)
    @name = name
    @artist = artist
    @@all = []
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all 
    @@all = []
  end
  
  def save 
    @@all << self 
  end 
  
  def self.create(name)
    new_song = Song.new(name)
    new_song.save 
    new_song
  end
  
  #def artist(artist)
    #self.artist.name
  #end
    
  #def artist=
    #@artist = artist.add_song(song)
    #@artist.songs << self
  #end
end 