class Genre
  
  attr_accessor :songs 
  
  @@all = []
  
  def initialize(genre_name)
    @name = genre_name 
    @songs = []
  end 
  
  def name=(genre_name)
    @name = genre_name
  end 
  
  def name 
    @name 
  end 
  
  def self.all 
    @@all 
  end 
  
  
  def self.destroy_all 
    @@all.clear 
  end 
  
  def save 
    @@all << self 
  end 
  
  
  def self.create(genre_name) 
    new_genre = self.new(genre_name)
    @@all << new_genre
    new_genre
  end 
  
  def songs 
    @songs
  end 
  
  def add_song(song_instance)
    @songs << song_instance if !@songs.include? song_instance
    song_instance.genre = self if song_instance.genre != self
  end 
  
  
end 