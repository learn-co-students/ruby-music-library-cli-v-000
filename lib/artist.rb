require 'pry'
class Artist
  attr_accessor :name, :songs, :genres

  @@all = []

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

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end
    @songs << song unless  @songs.include?(song)
  end

  def genres
    genres = []
    self.songs.collect do |i|
      genres << i.genre
    end
    genres.uniq
  end

end
