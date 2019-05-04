require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genre
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

#creates an instance of a song and associates it with an artist
  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless songs.include?(song)
  end

#returns a collection of genres for all the artists without duplicates
  def genres
    songs.collect{|song| song.genre}.uniq
  end

end
