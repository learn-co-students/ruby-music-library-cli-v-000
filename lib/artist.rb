require 'pry'
require './concerns/findable.rb'

class Artist
  extend Concerns::Findable

  @@all = []

  attr_accessor :name

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

  def add_song(song)
    @song = song
    @songs << @song if !@songs.include?(@song)
    song.artist = self if song.artist != self
  end

  def genres
    self.songs.map{|song| song.genre}.uniq
  end

  def songs
    @songs 
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

end
