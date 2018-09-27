class Genre
  extend Concerns::Findable
  
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
    genre = self.new(name)
    genre.save
    genre
  end 
  
   def add_song(song)
     song.genre if song.genre.nil?
     self.songs << song unless self.songs.include?(song) 
  end
  
  def songs
    @songs
  end 
  
  def artists
    songs.map {|song| song.artist}.uniq
  end 


end   
