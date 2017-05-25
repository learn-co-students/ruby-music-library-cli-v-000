require 'pry'

class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable

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
    @@all = []
  end

  def self.create(name)
    artist = Artist.new(name)
    self.all << artist
    artist
  end

  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    end
    if song.artist == nil
      song.artist = self
    end
  end

  def songs
    @songs.each { |s|
      puts s.name}
  end

  def genres
    @songs.collect {|song|
      song.genre}.uniq
  end

  def self.list_artists
    @@all.collect {|artist|
      puts artist.name}
    end
end
