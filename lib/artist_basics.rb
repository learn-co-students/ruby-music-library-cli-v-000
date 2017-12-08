require 'pry'

class Artist
  attr_accessor :name, :songs, :genre

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(artist)
    artist = Artist.new(artist)
    artist.name = artist
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    if @songs.include?(song) == false
      @songs << song
    end
  end

  def genres
    array_of_genres = @songs.collect do |song|
      song.genre
    end
    array_of_genres.uniq
  end

end
