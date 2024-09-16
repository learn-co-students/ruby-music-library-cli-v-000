class Genre 
  @@all = []
  attr_accessor :name
  extend Concerns::Findable
  def initialize(name)
    @name = name 
    @songs = []
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
  
  def self.create(name)
    genre = self.new(name)
    genre.save 
    genre 
  end
  
  def songs 
    @songs
  end
  
  def add_song(song)
    if !@songs.include?(song)
    @songs << song 
    song.genre = self if song.genre.nil?
    end
  end
  
  def artists 
    @songs.collect {|song| song.artist}.uniq
  end
    
     
      
end