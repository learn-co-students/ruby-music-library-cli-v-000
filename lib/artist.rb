require_relative './concerns/findable.rb'
require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name, :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end 
    if
      !@songs.include?(song)
       @songs << song
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

  def self.all
    @@all
  end

  def save
   @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save 
    new_artist
  end



end