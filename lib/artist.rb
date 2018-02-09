require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
  end

  def add_song(song)
    if songs.include?(song) == false
      songs << song
    end

    if song.artist == nil
      song.artist = self
    end
  end

  def genres
    songs.collect do |song|
      song.genre
    end.uniq
  end
end
