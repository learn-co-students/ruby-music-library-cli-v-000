require'pry'

class Artist
  extend Concerns::Findable
  include Concerns::Saveable

  attr_accessor :name, :song, :songs

  @@all = []

  def initialize (name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs<<song unless @songs.include?(song)
    song.artist = self if song.artist!=self
    @songs
  end

  def genres
    @songs.collect{|song|song.genre}.uniq
  end

  def self.all
    @@all
  end
end
