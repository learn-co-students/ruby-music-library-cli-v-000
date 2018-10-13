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


class Artist
  
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
  
  def self.create(art_name)
    art_name = Artist.new(art_name)
    art_name.save
    art_name
  end
end


class Genre
  
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
  
  def self.create(genre_name)
    genre_name = Genre.new(genre_name)
    genre_name.save
    genre_name
  end
end