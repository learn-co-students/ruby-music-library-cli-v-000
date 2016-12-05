require 'pry'

class Artist
 extend Concerns::Findable

  attr_accessor :name, :songs, :genre

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
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    self.all << artist
    artist
  end

  def add_song(song)
   @songs << song unless @songs.include?(song)
   song.artist = self unless song.artist
   #song.artist = self unless self.artist which is like saying we're going to set the artist to song.artist unless song.artist exists
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end
end
