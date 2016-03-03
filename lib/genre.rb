require 'pry'
require_relative '../concerns/findable.rb'

class Genre 
  extend Concerns::Findable
  attr_accessor :name, :songs, :artist
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
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

  def self.count
    @@all.size
  end

  def self.create(name)
    genre = Genre.new(name)
  end

  def add_song(song)
    if song.genre != self
      song.genre = self
    end
    if !@songs.include?(song)
      @songs << (song)
    end
  end

  def artists
    self.songs.collect {|song| song.artist }.uniq
  end
  
end 
