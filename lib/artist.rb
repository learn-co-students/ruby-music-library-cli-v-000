class Artist
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

  def add_song(song)
    if !@songs.include?(song)
    @songs << song
  end
    if song.artist = nil
    song.artist = self
  end
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
end
