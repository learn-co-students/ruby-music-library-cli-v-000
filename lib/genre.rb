require_relative './concerns/findable.rb'
require 'pry'
class Genre
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if song.genre != self
      song.genre = self
    end 
    if
      !@songs.include?(song)
       @songs << song
    end
  end

  def songs
    @songs
  end

  def artists
    @songs.collect {|song| song.artist}.uniq
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
    new_genre = Genre.new(name)
    new_genre.save 
    new_genre
  end



end