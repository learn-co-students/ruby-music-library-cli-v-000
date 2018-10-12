require 'bundler'
Bundler.require

module Concerns
end

require_all 'lib'



class Song
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name= name
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
  
  def self.create(song_name)
    song_name = Song.new(song_name)
    song_name.save
    song_name
  end
end