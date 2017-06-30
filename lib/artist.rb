require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name, :song, :genre

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
    self.class.all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if self.songs.detect(song) && song.artist != self
      song.artist = self
      self.songs << song
  end
end

def genres
  @songs.collect {|g| g.genre}.uniq
end
end
