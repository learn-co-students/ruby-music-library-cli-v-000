require_relative '../lib/concerns/findable.rb'
require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

    @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def name=(name)
    @name = name
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
    @@all.last
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if song.artist == self && !@songs.include?(song)
      @songs << song
    end
  end

  def songs
    @songs
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end

end