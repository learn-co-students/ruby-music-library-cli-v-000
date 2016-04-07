require 'pry'
require_relative '../config/environment.rb'

class Artist
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
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    self.songs << song if !(self.songs.include?(song))
    #  the !(song.artist == self) is a way to prevent an infinite loop
    song.artist = self if !(song.artist == self)
  end

  # list all the unique genres from this artist's songs
  def genres
    genres = songs.collect do |song|
      song.genre
    end
    genres.uniq
  end

end
