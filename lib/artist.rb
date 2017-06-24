require 'pry'
require_relative './Concerns/findable.rb'

class Artist

  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def genres
    self.songs.collect { |song| song.genre }.uniq
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
end
