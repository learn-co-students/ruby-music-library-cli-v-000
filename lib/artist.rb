require_relative '../concerns/findable.rb'
require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genres

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    self.songs << song if !self.songs.include?(song)
    song.artist = self if !song.artist
  end

  def genres
    @songs.collect do |song|
        song.genre
    end
    .uniq
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  # constructor
  def self.create(name)
    new_by_name = Artist.new(name)
    new_by_name.save
    new_by_name
  end
end
