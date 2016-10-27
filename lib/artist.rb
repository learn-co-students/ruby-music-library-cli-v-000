

class Artist
  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = [] #holds all Artist objects

  def self.create(name)
    s = Artist.new(name)
    s.save
    s
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    end

    if song.artist != self
      song.artist = self
    end
  end

end
