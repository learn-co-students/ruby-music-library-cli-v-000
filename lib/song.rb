require 'pry'

class Song
  attr_accessor :name, :artist, :genres
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    self.artist= artist unless !artist
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    self.new(name).tap{|song| song.save}
  end

  def artist=(artist)
      @artist = artist unless !!@artist
      artist.add_song(self) unless artist.songs.include?(self)
  end
end
