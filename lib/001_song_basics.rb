class Song 
  attr_accessor :name, :artist, :genre
  
  
  @@all = []
  
  def initialize(name,artist = nil ,genre= nil)
    @name = name 
    @artist = artist 
    self.artist = artist if artist 
    @genre = genre
    self.genre = genre if genre 
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end 
  
   def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end 


  
  def self.all 
    @@all
  end 
  
  def self.destroy_all 
    self.all.clear
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end 
  
  def self.find_by_name(name)
    self.all.each {|s| return s if s.name = name}
  end 
  



end 