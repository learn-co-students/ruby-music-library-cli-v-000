require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist
  @@all = []

  def initialize(name, artist_object = nil)
    self.name = name

    #artist_object.add_song(self) if artist_object
    self.artist = (artist_object) if artist_object

  end

  def self.create(name)
    new_instance = self.new(name)
    new_instance.save
    new_instance
  end

  def artist=(artist_object)
    artist_object.add_song(self)
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
