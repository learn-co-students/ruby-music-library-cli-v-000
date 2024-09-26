require 'pry'
require_relative '../config/environment.rb'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name="DefaultName")
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name="DefaultName")
    song = Artist.new(name)
    song.save
    song
    #binding.pry
  end

  def save
    @@all << self
  end

  def add_song(song)
    if self.songs.include?(song) == false
      @songs << song
      song.artist = self
    end
    song
  end

  #def songs
  #  @songs
  #end

  def genres
    a = []
    @songs.each do |song|
      a << song.genre
    end
    a.uniq
  end
end

