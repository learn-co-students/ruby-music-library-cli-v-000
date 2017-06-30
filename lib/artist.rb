require "pry"

class Artist
  @@all = []
  GENRES = []
  extend Concerns::Findable
  attr_accessor :name, :songs, :genres
    def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist != self
    self.genres
    @songs
  end

  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre unless genres.include?(song.genre)
    end
    genres
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
      artist = Artist.new(name)
    artist.save
    artist
  end
  # extend Concerns::Findable

end
