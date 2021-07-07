require_relative '../lib/concerns/findable.rb'
class Artist
  @@all = []
  extend Concerns::Findable
  attr_accessor :name, :songs
  def initialize(name)
    @name = name
    @songs = []
  end
  def save
    @@all << self
  end
  def self.all
    return @@all
  end
  def self.destroy_all
    @@all = []
  end
  def songs
    return @songs
  end
  def genres
    arr = []
    songs.each do |song|
      if arr.include?(song.genre) == false
        arr << song.genre
      end
    end
    return arr
  end
  def self.create(name)
    artist = Artist.new(name)
    @@all << artist
    return artist
  end
  def add_song(song)
    if self.songs.include?(song) || song.artist != nil
      return "Sorry, song already has an artist."
    else
      self.songs << song
      song.artist = self
    end
  end
end
