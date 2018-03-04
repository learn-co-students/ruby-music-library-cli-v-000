require 'pry'

class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist = nil)
    @name = name
    self.artist = artist if artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new(name).tap{|a| a.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

end
