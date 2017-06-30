require 'pry'
require_relative '../lib/concerns/Findable.rb'
class Artist
  extend Concerns::Findable
  @@all = []
  attr_accessor :name, :songs, :genres
  #attr_writer :artist, :songs
  def initialize (name)
    @name = name
    @songs = []
    #self.class.all << self
    #@genres = []
  end
  def add_song(song)#sets artist for the instance
    #binding.pry
    if self.songs.include?(song) == false
      @songs << song
      #binding.pry
    end
    if song.artist == nil
    song.artist = self
    end
  end
  def self.all
      @@all
      #binding.pry
  end
  def self.destroy_all
      @@all = []
  end
  def save
      @@all<< self
  end
  def genres#(genre)
    genres_collect = self.songs.collect do |song| song.genre end
    #do block inside calls on successive element
    #(.genre)
    #of the array it collected from(self.songs)
    genres_collect.uniq
    #http://ruby-doc.org/core-1.9.3/Array.html#method-i-uniq
  end
end
