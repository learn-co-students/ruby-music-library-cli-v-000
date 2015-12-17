require 'pry'

class Artist
  attr_accessor :name, :song, :genre, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs =[]
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    # binding.pry
    @songs << song if self.songs.include?(song) == false
    # binding.pry
    song.artist = self if song.artist == nil
  # binding.pry
  end

  def find_or_create_by_name(name)
  end

  def save
    @@all << self
  end
 
  def self.all 
    @@all
  end
 
  def self.destroy_all
    @@all.clear
  end   
end