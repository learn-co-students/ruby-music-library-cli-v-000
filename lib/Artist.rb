class Artist 
  
  attr_accessor :songs , :genres
  @@all = []
  
  def initialize(artist_name)
    @name = artist_name
    @songs = []
  end 
  
  def name=(artist_name)
    @name = artist_name
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
  
  
  def self.create(artist_name) 
    new_artist = self.new(artist_name)
    @@all << new_artist 
    new_artist
  end 
  
  def songs 
    @songs 
  end 
  
  def add_song(song_instance)
    @songs << song_instance if !@songs.include? song_instance
    song_instance.artist = self if song_instance.artist != self
  end 
  
  def genres
    @songs.map{|song| song.genre}.uniq
  end 
  
  
end 