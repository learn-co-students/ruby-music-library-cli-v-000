require 'pry'
class Artist
  extend Concerns::Findable

  @@all = []
  attr_accessor :name

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

    @@all << artist
    artist
  end

  def songs
    @songs
  end
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    genre_array = []
    self.songs.collect{|song|  genre_array << song.genre}
    genre_array.uniq
    # binding.pry

  end

end
