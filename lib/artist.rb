require 'pry'
class Artist
  attr_accessor :name
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

  def self.create(artist)
    created_artist = self.new(artist)
    created_artist.save
    created_artist
  end

  def songs
    @songs
  end

  def add_song(song)
  song.artist = self unless song.artist == self
  @songs << song unless @songs.include?(song)
  end


end
