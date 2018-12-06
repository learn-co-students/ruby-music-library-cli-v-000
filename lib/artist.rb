class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []
 
  def initialize(name)
    @songs = []
    @name = name
  end

  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.artist = self if song.artist == nil
  end
  
  def genres
    @songs.collect{|song| song.genre}.uniq
  end
  
end
