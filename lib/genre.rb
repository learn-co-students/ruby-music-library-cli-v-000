require 'pry'
require_relative 'concerns.rb'
class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs, :artists

  @@all = []


  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.create(name)
    new = self.new(name)
  end



  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.genre == self && !self.songs.include?(song)
      @songs << song
    elsif !song.genre
      song.genre = self
    end
  end

  def artists
    arr = []
    @songs.each do |song|
      if !arr.include?(song.artist)
        arr << song.artist
      end
    end
      arr
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
    song = new(name)
    song.save
    song
  end

end
