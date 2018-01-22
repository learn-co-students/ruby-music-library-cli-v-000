require 'pry'

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
    @@all << self #self.class.save << self

  end
  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist

  end

  def add_song(song)
    song.artist=(self) if !song.artist
    @songs << song if !@songs.include?(song)
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end
