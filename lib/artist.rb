require 'pry'

class Artist
  attr_accessor :name

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

  def songs
    @songs
  end

  def add_song(song)
    if self != song.artist
      song.artist = self
        @songs << song
    end
    # songs.detect do |song|
    #   if self != song

    #
    #   end
    # end
  end
end
