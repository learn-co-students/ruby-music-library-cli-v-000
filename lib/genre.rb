class Genre 
  extend Concerns::Findable
  attr_accessor :name, :song 
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
  
  def artists 
    artist = []
    @songs.each do |song|
      if artist.include?(song.artist)
        
      else 
        artist << song.artist 
      end 
    end 
    artist 
  end 
  
  def add_song(song)
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
    genre = Genre.new(name)
    genre.save 
    genre
  end 
end 