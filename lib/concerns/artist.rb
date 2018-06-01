require 'pry'

class Artist

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    new_name = Artist.name
    @@all << new_name
  end

  #Custom Constructor
  def self.create(new_artist)
    n = Artist.new(new_artist)
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist 
  end
 # binding.pry
end
