require 'bundler'
Bundler.require

require_all 'lib'

module Concerns
end

module Concerns::Findable
end

class Song
  attr_accessor :name, :artist 
  
  @@all = [] 

  def initialize(name)
    @name = name  
    @@all << self 
  end

  def self.artist=(artist)
   @artist = artist
   artist.songs << self
  end


  def Song.all 
    @@all 
  end 

  def Song.destroy_all 
    self.all.clear 
  end

  def save 
    @@all
  end

  def Song.create(song)
    item = Song.new(song)
  end
end


class Artist
  attr_accessor :name
  attr_reader :songs 

  @@all = [] 

  def initialize(name)
    @name = name 
    @@all << self 
    @songs = []
  end



  def Artist.all 
    @@all 
  end

  def Artist.destroy_all 
    Artist.all.clear 
  end

  def save 
    @@all
  end

  def Artist.create(artist)
    item = Artist.new(artist)
  end

  def add_song(song)
    songs << song if songs.include?(song.name)
    song.artist = self unless !song.artist.nil?
  end

end

class Genre
  attr_accessor :name 

  @@all = [] 

  def initialize(name)
    @name = name 
    @@all << self 
  end

  def Genre.all 
    @@all 
  end

  def Genre.destroy_all
    Genre.all.clear
  end

  def save 
    Genre.all 
  end

  def Genre.create(genre)
    item = Genre.new(genre)
  end
end


