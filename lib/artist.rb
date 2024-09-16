require_relative "../config/environment.rb"
require 'pry'

class Artist
  extend Concerns::Findable
  
  
  attr_accessor :name, :song, :genres, :songs

  @@all = []


  def initialize(name)
    @name = name
    @songs =[]
    # self.save
    # had to add save here to pass spec 006; calling #Artist.new does not 
    # add artist to @@all at any other point (#Song in this case initializes with 
    # Artist object, so doesn't call "create" method)
    # as a knock-on effect, had to update #save to avoid duplicaiton, but I 
    # think this is actually a useful bit of functionality to have. 
    # Eventually added #artist.save to Song.initialize to handle
    # cases like this (when Song is initailized and given an Artist object)
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
    @@all.collect{|artist| 
      artist.songs.collect{|song| 
        song.genre
      }
    }.flatten.uniq
  end
  
  def save
    @@all << self 
    #if @@all.include?(self) == false
  end
 
  def self.all 
    @@all
  end
 
  def self.destroy_all
    @@all.clear
  end   
end