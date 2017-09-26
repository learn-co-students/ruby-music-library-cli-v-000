require 'pry'

class Artist
  attr_accessor :name, :genre

  @@all = []

  def initialize(name, artist = nil)
    # @artist = artist
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

  def self.create(name)
      self.new(name).tap{|a| a.save} #initializes and saves the artist
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
      self.songs.collect{ |s| s.genre }.uniq
  end

end
