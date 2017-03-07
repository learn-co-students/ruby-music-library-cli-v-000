class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    song.artist == self ? song.artist : song.artist = self
    @songs.include?(song) ? @songs : @songs << song
  end
  
  def genres
    self.songs.map {|song| song.genre}.uniq
  end
  
end