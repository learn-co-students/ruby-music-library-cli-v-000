class Artist 
  extend Concerns::Findable
  attr_accessor :name, :songs 
  
  @@all = []
  
  def initialize (name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.create (name)
    new(name).tap{ |artist| artist.save }
  end

  def genres
    songs.collect{ |s| s.genre }.uniq
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
  
end