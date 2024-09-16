
class Artist
  extend Concerns::Findable
  attr_accessor :name, :song
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  def save
    @@all << self
  end
  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    if !song.artist
      song.artist = self
    end
  end
  def songs
    @songs
  end
  def genres
    self.songs.collect{|s|
      s.genre
    }.uniq
  end
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
  def self.destroy_all
    @@all.clear
  end
  def self.all
    @@all
  end
end
