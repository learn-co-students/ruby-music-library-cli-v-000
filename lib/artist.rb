require "pry"
class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize (name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song (song)
    song.artist = self if !song.artist
    songs << song unless songs.include?(song)
  end

  def genres
    songs.collect { | song | song.genre }.uniq
  end

  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def self.create (name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

end
