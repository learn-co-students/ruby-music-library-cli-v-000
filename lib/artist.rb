require 'pry'

class Artist

  attr_accessor :name, :songs, :genres

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all.push(self)
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
  #  if song.artist == nil
    song.artist ||= self
  #  end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end
