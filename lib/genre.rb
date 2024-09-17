require 'pry'

class Genre
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
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

  def self.create(genre)
    self.new(genre)
  end

  def add_song(song)
     song.genre = self if song.genre == nil
     @songs << song if !self.songs.include?(song)
  end

  def songs
    @songs
  end

  def artists
    all_artist = @songs.collect {|song| song.artist}
    all_artist.uniq
  end
end
