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
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    @@all << artist
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      @songs << song
      song.artist = self
    end
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
    binding.pry
  end

end
