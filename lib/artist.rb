require 'pry'

class Artist
  attr_accessor :name
  extend Concerns::Findable

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
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    a = Artist.new(name)
    a.save
    a
  end

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
    end
    if song.artist == nil
      song.artist = self
    end
  end

  def genres
    songs.collect do |s|
      s.genre
    end.uniq
  end
end
