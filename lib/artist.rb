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
    self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    #conditional to check if song already exists
    if !@songs.include?(song)
      @songs << song
    end
  end

  def genres
    return_genres = []
    self.songs.collect do |song|
      return_genres <<song.genre
    end
    return_genres.uniq
  end

end
