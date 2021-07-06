class Artist
  extend Concerns::Findable 
  
  attr_accessor :name, :songs, :genres
  
  @@all = [] 
  
  def initialize(name) 
    @name = name
    @songs = []
  end 
  
  def self.all 
    @@all 
  end 
  
  def save 
    @@all << self unless @@all.include?(self)
  end 
  
  def self.destroy_all 
    @@all.clear 
  end
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist 
  end 
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    @songs << song unless @songs.include?(song)
  end 
  
  def genres 
    self.songs.collect{ |song| song.genre }.uniq
  end
  
end 