require 'pry'

class Artist
  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    self.name = name
    self.songs = []
  end

  def save
    self.class.all << self
  end

  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?(song)
  end

  # MEMORABLE
  def self.create(name)
    artist = self.new(name)
    artist.save
    return artist
  end

  def self.destroy_all
    self.all.clear
  end

end
