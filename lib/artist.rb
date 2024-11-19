class Artist
  extend Concerns::Findable
  attr_accessor :name, :song
  attr_reader :songs, :genres
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    all.clear
  end
  
  def save
    self.class.all << self
  end
  
  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    songs.push song unless songs.include?(song)
  end
  
  def genres
    songs.collect(&:genre).uniq
  end
  
end