require 'pry'
class Song
  @@all = []
  attr_accessor :name, :genre
  attr_reader :artist

  def initialize(name, artist = nil)
    @name = name
    self.artist=(artist) unless artist == nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self) unless @artist.songs.include?(self)
  end

end