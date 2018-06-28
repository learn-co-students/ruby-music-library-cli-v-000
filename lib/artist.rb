require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if !song.artist
      song.artist = self
    end
    if ! @songs.detect { |i| i == song }
      @songs << song
    end
  end

  # def songs=(songs)
  #   @songs = []
  # end

  def songs
    @songs
  end

  def genres
    genres = @songs.collect { |song| song.genre }
    genres.uniq
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
    artist = self.new(name)
    artist.save
    artist
  end
end
