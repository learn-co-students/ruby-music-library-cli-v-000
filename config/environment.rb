require 'bundler'
Bundler.require

module Concerns
end

require_all 'lib'


class Song
  
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name, artist=nil)
    @name= name
    @artist= artist
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
  
  def artist=(artist)
    @artist= artist
    artist.add_song(self)
  end
  
end


class Artist
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name= name
    @songs = []
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
  
  def add_song(song)
    if song.artist == nil
     song.artist = self
     @songs << song
    end
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