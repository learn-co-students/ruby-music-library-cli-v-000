require 'pry'
class Artist
  extend Concerns::Findable
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
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !song.artist.songs.include?(song)
      song.artist.songs << song
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end
end
