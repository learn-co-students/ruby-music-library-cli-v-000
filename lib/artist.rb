require_relative 'song.rb'
require 'pry'

class Artist
  # extend Concerns::Findable
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
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    created = self.new(name)
    created.save
    created
  end

  def add_song(song)
    songs << song if !songs.include?(song)
    song.artist = self if song.artist != self 
  end

  def genres
    songs.collect do |song|
      song.genre
    end.uniq
  end
end
