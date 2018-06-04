 class Artist 
  extend Concerns::Findable
  attr_accessor :name, :artist, :songs, :genre
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def self.all 
    @@all 
  end 
  
  def save 
    @@all << self 
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
    song.artist = self unless song.artist == self
    @songs << song unless @songs.find{|a| a == song} 
  end 
  
  def genres
   genres_collect = @songs.collect{|a| a.genre}
   genres_collect.uniq 
  end 
  
end 