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
    # self.@@all.clear
    @@all = []
  end 
  
  def self.create(new_genre) 
    n_g = Genre.new(new_genre)
    n_g.save
    n_g
  end 
  
  def songs
    @songs
  end 
  
  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    end
    
    song.genre ||= self
  end 
  
  def artists 
    songs.collect{ |s| s.artist }.uniq
  end

  
  
end   
  