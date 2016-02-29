require 'pry'

class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist=nil)
    @name = name
    if artist!= nil
      self.artist = artist
    end
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.create(name)
    song = Song.new(name)
  end

end