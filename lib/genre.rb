class Genre 
  attr_accessor :name
  @@all = []
  extend Concerns::Findable
  
  def initialize(name)
    @name = name
    @songs = []
  end 
  
  def self.all 
    @@all
  end
  
  def save 
    self.class.all << self
  end
  
  def self. destroy_all 
    self.all.clear
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
    @songs << song unless self.songs.include?(song)
    song.genre = self if song.genre == nil
  end 
  
  def artists 
    self.songs.collect {|s| s.artist}.uniq
  end 
  
  
  
end