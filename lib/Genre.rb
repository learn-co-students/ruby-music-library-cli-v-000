require 'pry'

class Genre
  attr_accessor :artist, :name, :songs
  extend Concerns::Findable

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
    self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end


  # def add_song(song)
  #   @songs << song
  #   @genres << song.genre.artist
  #   song.genre.artist << self
  # end

end
