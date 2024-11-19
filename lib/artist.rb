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
  
  def self.destroy_all
    self.all.clear 
  end 
  
  def save 
    self.class.all << self 
  end 
  
  def self.create(artist_name)
    new_artist = new(artist_name)
    new_artist.save
    new_artist 
  end 
  
  def songs 
    @songs 
  end 
  
  def add_song(song)
    song.artist = self unless song.artist == self 
    @songs << song unless songs.include?(song)
  end 
  
  def genres 
    songs.collect {|s| s.genre}.uniq
  end 

end 