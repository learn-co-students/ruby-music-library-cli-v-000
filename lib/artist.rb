class Artist
  @@all = [ ]
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = [ ]
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?(song)
  end

# Class methods
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
