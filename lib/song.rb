require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist
  @@all = []


  def initialize(name, artist = nil)
    @name = name
    if artist
      self.artist = artist
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    created_song = Song.new(name)
      created_song.save
      created_song
  end
end
