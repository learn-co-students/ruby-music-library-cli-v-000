require 'pry'

class Genre
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
  end

  def self.create(name)
    new(name).tap{|g| g.save}
  end

  def add_song(song)
    @songs << song unless songs.include?(song)
    song.genre = self unless song.genre == self
  end
end
