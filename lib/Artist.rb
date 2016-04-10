require 'pry'
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
    self.all.clear
  end

  def save
    @@all << self
  end

  def add_song(song)
    if song.artist = self && @songs.include?(song)
      nil
    else
     song.artist = self
     @songs << song
    end

  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def genres
    self.genre
  end

end