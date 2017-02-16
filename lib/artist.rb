require 'pry'

class Artist
  attr_accessor :name, :song

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    self.songs << song unless @songs.find {|song| song}
    song.artist = self unless song.artist == self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(song)
    new_song = self.new(song)
    new_song.save
  end
end
