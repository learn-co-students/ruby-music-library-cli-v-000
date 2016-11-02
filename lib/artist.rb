require './concerns/findable.rb'
require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all = [] #holds all Artist objects

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    artist_already_exists = @@all.detect {|artist| artist.name == name }
    if artist_already_exists == nil
      s = Artist.new(name)
      s.save
      s
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    end

    if song.artist != self
      song.artist = self
    end
  end

  def genres
    genres = @songs.collect {|song| song.genre }
    genres.uniq
  end

end
