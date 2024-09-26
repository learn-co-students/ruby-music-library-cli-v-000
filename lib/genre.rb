require 'pry'

require_relative './concerns/findable.rb'

class Genre

  attr_accessor :name

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song if @songs.include?(song) == false
    song.genre = self if song.genre == nil
  end

  def save
    @@all << self
  end

  def self.create(name)
    Genre.new(name)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def artists
    (@songs.collect {|song| song.artist}).uniq
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) != nil
      find_by_name(name)
    else
      create(name)
    end
  end

end
