require_relative '../lib/concerns/findable.rb'

class Artist
  #extend - takes methods from module into class as class methods
  extend Concerns::Findable
  attr_accessor :name, :songs, :artist
  #@@genres = []
  #@@artists = []
  @@all = []

  def initialize(name)
    @name = name
    @songs=[]
    #@@artists << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def artist=(artist)
    @artist = artist  
  end

  def save
    @@all << self
  end

  def genres
    self.songs.collect {|song| song.genre}
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    @songs.include?(song) ? nil : @songs << song 
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

end