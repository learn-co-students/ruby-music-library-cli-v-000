require "pry"
class Song
  attr_accessor :name, :artist, :artist_name

  @@all = []

  def initialize(name, artist = nil)
    @name = name
    self.artist = Artist.new(name)
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

end
