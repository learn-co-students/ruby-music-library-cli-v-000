require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  # attr_reader :songs

  @@all =[]

  def initialize(name)
    @songs = []
    @@all << self
    @name = name
  end

  def add_song(song)
    @@all << songs unless self.songs.include?(song)
    # self.songs << song
    song.artist = self unless song.artist
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
    self.new(name).tap { |new_artist| new_artist.save }
    # artist = new(name)
    # artist.save
    # artist
  end

  def add_song(song)
    song.artist = self if !song.artist
    @songs << song if !@songs.include?(song)
  end

  def genres
    @songs.collect { |song| song.genre }.uniq
  end

end
