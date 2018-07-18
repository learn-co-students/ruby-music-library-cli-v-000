require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

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
      song.artist = self unless song.artist  #just incase you instantiate a song just by it's name, and with no artist.
        @songs << song unless songs.include?(song)
  end

  def genres
    songs.collect do |song|
        song.genre
    end.uniq
  end
end
