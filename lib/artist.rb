require_relative './concerns/findable.rb'

class Artist
  
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = self.new(name)
    @@all << artist
    artist
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist = self if song.artist == nil
  end

  def songs
    @songs
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end