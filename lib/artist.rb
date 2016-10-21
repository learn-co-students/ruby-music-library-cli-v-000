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

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    #self.all << artist
    artist
  end

  def add_song(song)
    self.songs.include?(song) ? self.songs : self.songs << song #Adds song only if doesnt exist
    song.artist ? nil : song.artist = self #Adds song artist only if it doesnt exist already
  end

  def genres
    genre_collector = []
    @songs.each do |song|
      genre_collector.include?(song.genre) ? nil : genre_collector << song.genre
    end
    genre_collector
  end
end
