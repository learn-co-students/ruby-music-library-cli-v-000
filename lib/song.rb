require 'pry'
class Song 
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = [] 
  
  def initialize(name, artist = nil, genre = nil)
    
    @name = name 
    if artist 
      self.artist = artist 
    end 
    if genre 
      self.genre = genre 
    end 
    
  end 
  
  def self.all 
    @@all 
  end 
  
  def save 
    @@all << self
  end 
  
   def artist=(artistOb)
     @artist = artistOb
     artistOb.add_song(self) 
     #@artist
   end 
   
   def genre=(genreOb)
     @genre = genreOb
     genreOb.add_song(self)
   end 
  
  def self.destroy_all 
    @@all = []
  end 
  
  def self.create(name) 
    song = Song.new(name)
    song.save
    song
    # binding.pry
  end 
  
  def self.new_from_filename(file)
    artist = file.split(" - ")[0]
    name = file.split(" - ")[1]
    genre = file.split(" - ")[2]
    genre = genre.split(".")[0]
    genreOb = Genre.find_or_create_by_name(genre) 
    artistOb = Artist.find_or_create_by_name(artist) 
    songOb = Song.new(name, artistOb, genreOb)
    songOb
  end 
  
  def self.create_from_filename(file)
    songOb = self.new_from_filename(file)
    songOb.save
  end 

end 