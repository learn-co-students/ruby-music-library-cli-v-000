class Artist
  extend Concerns::Findable
  attr_accessor :name, :genre, :artist, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end
  
  def self.all 
   @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.find_by_name(artist_name)
    self.all.detect{|artist| self.artist}
  end
  
  def genres
    song.collect{|song| self.genre}
  end

  def self.find_or_create_by_name(artist_name)
    self.find_by_name(artist_name) || self.new(artist_name)
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
