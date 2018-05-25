require 'pry'

class Artist
  attr_accessor :name

  # CLASS VARIABLES AND METHODS
  @@all = Array.new

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  # INSTANCE VARIABLES AND METHODS
  def initialize(name)
    @name = name
    @songs = Array.new
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist.nil?
      song.artist = self
    end

    if !(@songs.include?(song))
      @songs << song
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end
end
