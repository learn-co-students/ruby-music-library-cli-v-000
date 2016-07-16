require_relative '../concerns/findable.rb'

class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def artist=(artist)
    @artist = artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self unless songs.include?(song)
    self.songs << song unless songs.include?(song)

  end

  def genres
    songs.collect { |song| song.genre }.uniq
  end

end