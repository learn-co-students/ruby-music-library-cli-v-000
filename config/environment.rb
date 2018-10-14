require 'bundler'
Bundler.require

module Concerns
end

require_all 'lib'


class Song
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name= name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
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
  
  def genre=(genre)
    @genre= genre
    genre.add_song(self)
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
  
  def self.create(genre_name)
    genre_name = Genre.new(genre_name)
    genre_name.save
    genre_name
  end
  
   def add_song(song)
    if song.genre == nil
      song.genre = self
      @songs << song
    end
  end
  
end



