require_relative './concerns/findable.rb'

class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs


  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)#add song to list of songs unless it's already there
    song.artist = self unless song.artist #add song's artist unless it already has one
  end

  def songs
    @songs
  end

  def genres
    genres = self.songs.collect { |song| song.genre }
    genres.uniq
  end

end
