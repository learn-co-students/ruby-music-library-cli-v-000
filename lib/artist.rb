require_relative '../config/environment'

class Artist

  attr_accessor :name
  extend Concerns::Findable

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
    @all
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    self.all << artist
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if(!song.artist)
      song.artist = self
    end
    if (!@songs.include?(song))
      @songs << song
    end
  end

  def genres
    @songs.collect { |song| song.genre }.uniq
  end



end
