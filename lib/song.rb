#Before we start: 
#type bundle install because this is a gem file 
#create this file with touch lib/song.rb. Do the same for genre and artist

require 'pry'
class Song 
  extend Concerns::Findable
  attr_accessor :name, :genre #name and =name
  attr_reader :artist
  
  @@all = [] #saves everything 

  def initialize(name, artist = nil, genre = nil) #accepts name for a new song
    @name = name 
    #artist= will invoke :artist if there is an artist  
    self.artist = artist if artist 
    self.genre = genre if genre 
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self) 
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
  end 
  
  def self.all    
    @@all
  end 
  
  def self.destroy_all    
    all.clear
  end 
  
  def save    #instance method, adds the Song instance to the @@all class variable 
    @@all << self
  end 
  
  def self.create(name)   #class method, initializes, saves, and returns the song
    song = self.new(name)
    song.save 
    song
  end 
  
  def self.new_from_filename(name)
    artist, song, genre_name = name.split(" - ")    #splits into 3 assigned variables by " - "
    fixed_name = genre_name.gsub('.mp3', '')    #deletes .mp3
    artist = Artist.find_or_create_by_name(artist)    
    genre = Genre.find_or_create_by_name(fixed_name)
    new(song, artist, genre)    #creates a new instance of each
  end 
  
  def self.create_from_filename(name)
    new_from_filename(name).save
  end 
end 