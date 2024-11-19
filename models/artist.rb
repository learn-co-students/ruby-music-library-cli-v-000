require_relative "../concerns/findable.rb"
require_relative "../models/song.rb"
require_relative "../models/genre.rb"

class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all

  #Accepts Name for a new Artist
  def initialize(name)
    @name = name
    @songs = []
  end

  #Returns the class variable @@all
  def self.all
    @@all
  end

  #Resets the class variable
  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  #Will initialize a new Artist and save that Artist to the class array
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def genres
    @songs.collect{|s| s.genre}.uniq
  end
end
