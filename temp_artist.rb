require 'pry'

class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self if @@all.include?(self) == false
  end

  def self.create(name)
    artist = Artist.new(name)
  end

  def add_song(song)
    if songs.include?(song) == false;
      @songs << song
      song.artist = self
    end
  end

end
