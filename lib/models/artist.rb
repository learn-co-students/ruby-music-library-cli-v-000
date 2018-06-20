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
    @@all << self
  end
  
  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end
  
  def add_song(song)
    if !song.artist
      song.artist = self
    end
    if !self.songs.include?(song)
      self.songs << song
    end
  end
  
  def genres 
    genre_array = self.songs.collect { |song| song.genre }
    genre_array.uniq
  end
  
end