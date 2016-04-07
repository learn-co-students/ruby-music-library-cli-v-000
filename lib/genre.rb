require 'pry'
require_relative '../config/environment.rb'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []# class variable
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all #can be put in a module
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end

  def add_song(song)
    if !(self.songs.include?(song))
      self.songs << song
    end
  end

  def artists
    # list all the artists this genre has through Songs
    artists = songs.collect do |song|
      song.artist
    end
    artists.uniq
  end

end
