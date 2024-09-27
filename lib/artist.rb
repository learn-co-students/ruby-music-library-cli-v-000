require 'pry'

class Artist
  attr_accessor :name, :genres

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end

    if @songs.include?(song) == false
      @songs << song
    end

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

  def self.create(artist_name)
    artist = self.new(artist_name)
    artist.save
    artist
  end

  def genres
    self.songs.collect { |song| song.genre }.uniq
  end

end
