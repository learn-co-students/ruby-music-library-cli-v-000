class Artist 
  extend Concerns::Findable
  attr_accessor :name 
  @@all = [] 
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def self.all 
    @@all 
  end 
  
  def songs 
    @songs
  end 
  
  def genres
    genre = []
    @songs.each do |song|
      if genre.include?(song.genre)
        
      else 
        genre << song.genre 
      end 
    end 
    genre
  end 
  
  def add_song(song)
    if song.artist == self 
      
    else 
      song.artist = self 
    end 
    
    if @songs.include?(song)
      
    else 
      @songs << song 
    end 
    
  end 
  
  def self.destroy_all
    @@all = [] 
  end 
  
  def save
    @@all << self 
  end 
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save 
    artist 
  end 
end 