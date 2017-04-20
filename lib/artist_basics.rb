require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(artist_name)
    Artist.new(artist_name).save
  end

  def add_song(song)
    if self.songs.include?(song) == false
    self.songs << song unless
    song.artist = self
  end
  end

  def songs
    @songs
  end

  def genres
    genres = self.songs.collect do |song|
      song.genre
    end
    genres.uniq
  end


end
