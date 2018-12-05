require 'pry'

class Song
  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
  @name = name
  self.artist = artist if artist
  self.genre = genre if genre
binding.pry
  #song_with_artist = Song.new("Two-Headed Boy", artist)
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
    new(name).tap {|s| s.save}
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end




end
