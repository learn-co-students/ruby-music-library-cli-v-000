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
    @@all.clear
  end

  def save
    @@all << self
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
    if song.artist.nil?
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
    song.artist
  end

  def genres
    genres = []
    self.songs.collect do |song|
      genres << song.genre
    end
    genres.uniq
  end
end

class Artist
  extend Concerns::Findable
end
