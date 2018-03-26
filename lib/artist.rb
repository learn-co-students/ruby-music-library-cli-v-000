class Artist
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name, songs = nil)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    songs.push song unless songs.include?(song)
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
  
  def genres
    songs.map(&:genre).uniq
  end
  
end
