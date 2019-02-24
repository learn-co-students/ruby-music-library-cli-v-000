 require 'pry'
class Song 
  
  attr_accessor :name
  attr_reader :artist, :genre  
  
  @@all =[]             #is initialized as an empty array
  
  def initialize(name, artist = nil, genre = nil )
    @name= name 
    self.artist = artist if artist 
    self.genre = genre if genre
  end 
  
  def self.all          #returns the class variable @@all
    @@all 
  end 
  
  
  def self.destroy_all  #resets the @@all class variable to an empty array
   @@all.clear
  end 
  
  def  save            #adds the Song instance to the @@all class variable
   @@all << self  
   self 
  end 
  

 def self.create(name)  #initializes, saves, and returns the song
  song = new(name)
  song.save 
  song
 end 
 
 def artist
   @artist
 end 
 
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.songs.push self unless genre.songs.include? self 
  end 
  
  def self.find_by_name(name) #finds a song instance in @@all by the name property of the song
    #@@all.detect do |song|
      #song.name == name 
      all.find { |song| song.name == name }
  
 end 
 
 def self.find_or_create_by_name(name)
   self.find_by_name(name) || create(name) #invokes .create instead of re-coding the same functionality
   
 end 
 
 def self.create_by_name(name)
   self.new(name).save
   
 end 
end 