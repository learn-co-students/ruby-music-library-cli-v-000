require_relative "../config/environment.rb"
require 'pry'

class Artist
  extend Concerns::Findable
  
  
  attr_accessor :name, :song, :genres, :songs

  @@all = []


  def initialize(name)
    @name = name
    @songs =[]
    self.save
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist ||= self
    @songs << song if songs.include?(song) == false
  end

  def genres
    genres = @@all.collect{|artist| 
      artist.songs.collect{|song| 
        song.genre
      }
    }.flatten.uniq
  end
  
  def save
    @@all << self if @@all.include?(self) == false
  end
 
  def self.all 
    @@all
  end
 
  def self.destroy_all
    @@all.clear
  end   
end