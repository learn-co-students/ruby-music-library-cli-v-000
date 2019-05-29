# require_relative "./concerns/findable"

class Artist
  attr_accessor :name
  attr_reader :songs, :genre

  @@all = []

  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def save
    self.class.all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    if !(self.songs.include?(song))
      self.songs << song
      song.artist = self if !song.artist
    end
  end

  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre if !genres.include?(song.genre)
    end
    genres
  end

end
