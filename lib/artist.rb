class Artist

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
    song.artist = self
    song
  end

  def songs
    @songs
  end

  def self.destroy_all
    self.all.clear
  end
end
