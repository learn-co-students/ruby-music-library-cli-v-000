require "pry"

class Artist

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
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    @@all << self.new(name)
    self
  end

def add_song(song)
  @songs << song unless @songs.include?(song)
  song.artist = self if !song.artist
end

def genres
  @songs.collect do |song|
    song.genre
  end.uniq
end

extend Findable::ClassMethods

  end
