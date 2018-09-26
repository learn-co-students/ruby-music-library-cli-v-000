class Song 
  attr_accessor :name, :genre, :artist
 
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil  
    self.genre = genre if genre != nil 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.all
    @@all
  end 
  
  def self.destroy_all 
    @@all = []
  end 
  
  def self.create(name)
    name = self.new(name)
    name.save
    name
  end 
  
  def artist_name
    self.artist.name
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre 
    genre.add_song(self)
  end 
  
  
  def self.name 
    @name 
  end 

  
end 