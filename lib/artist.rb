require 'pry'
class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def save
    @@all << self
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist || song.artist = self
  end

  def self.find_by_name(name)
    self.all.detect { | song | song.name == name }
  end

  def self.find_or_create_by_name(name)

  end
end
