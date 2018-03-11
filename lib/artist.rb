require 'pry'

class Artist
  attr_accessor :name, :songs
  @@all = []

  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

# Class Methods ========================
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

# =====================================================

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def genres
    arr = self.songs.collect{|song| song.genre}
    arr.uniq
  end

end
