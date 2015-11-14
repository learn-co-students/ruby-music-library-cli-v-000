require 'pry'

class Song
  attr_accessor :name, :artist
  
  @@all = []
  def initialize(name, artist=nil)
    @name = name
    self.artist = artist if artist != nil
  end

  def self.all 
    @@all 
  end

  def self.destroy_all 
    @@all.clear
  end

  def save
    @@all << self unless @@all.include?(self)
  end

  def self.create(song)
    new_song = Song.new(song)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end


end
