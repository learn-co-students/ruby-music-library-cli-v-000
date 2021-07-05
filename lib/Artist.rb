require 'pry'
class Artist
  attr_accessor :name, :song
  @@all = []

  def initialize(name)
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
  def self.create(name)
    artist = Artist.new(name)
    @@all << artist
    artist
  end
  def songs
    @songs
  end
  def add_song(song)
  if song.artist == nil
    song.artist = self
  end
  if !@songs.include?(song)
    @songs << song
  end
  end
  def genres
    songs.collect {|song| song.genre}.uniq
  end
extend Concerns::Findable
end
