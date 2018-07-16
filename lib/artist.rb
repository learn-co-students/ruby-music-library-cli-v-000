require 'pry'
class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  attr_reader :genre

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
  end

  def self.create(name)
    artist = self.new(name)
    self.all << artist
    artist
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if songs.detect {|s|s == song} == nil
      @songs << song #storing instances not strings
    end
  end

  def genres
    songs.collect {|song| song.genre}.uniq
  end

end
