require 'pry'

class Song

  attr_accessor :name, :artist

  @@all = []


  def initialize(name, artist = nil)
    @name = name
    # @@all << self
    self.artist = artist if artist
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

  def self.create(name)
    x = Song.new(name)
    x.save
    x
  end

  def artist=(artist)
    # artist = Artist.new(artist)
    artist.add_song(self)
  end

  # binding.pry


end
