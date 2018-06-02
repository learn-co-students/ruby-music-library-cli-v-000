class Artist
  extend Concerns::Findable
  
  attr_accessor :name
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    song.artist = self if !song.artist
    self.songs << song if !self.songs.include?(song)
  end
  
  def genres
    genres = songs.collect {|song| song.genre}
    genres.uniq
  end
    
end