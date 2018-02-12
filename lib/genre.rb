require 'pry'
require_relative "./concerns.rb"

class Genre
  extend Concerns::Findable
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
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def add_genre(song)
    if song.genre == nil
      song.genre = self
    end
    if self.songs.include?(song) == false
      self.songs << song
    end
  end

  def artists
     artists = self.songs.collect {|song| song.artist}
     artists.uniq
  end

end
