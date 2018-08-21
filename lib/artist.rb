class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all # Class reader
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << Artist
  end
end
