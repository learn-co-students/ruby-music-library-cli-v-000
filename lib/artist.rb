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
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    x = Artist.new(name)
    x.save
    x
    # binding.pry
  end

  def songs
    @songs
  end

  def add_song(song)
    # if song.artist == nil
      song.artist = self unless song.artist == self
      @songs << song unless @songs.include?(song)
    # end
    # binding.pry
  end



end
