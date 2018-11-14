require 'pry'
class Artist

attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    instance = new(name)
    instance.save
    instance
  end

  def add_song(song)
    if @songs.include?(song)
    else @songs << song
    end

    if song.artist = nil
    song.artist = self
    end
  end
end
