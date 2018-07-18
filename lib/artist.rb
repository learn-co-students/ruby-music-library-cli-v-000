#artist class definition
require 'pry'
require_relative "./concerns/findable.rb"

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

#CLASS METHODS

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    object = self.new(name)
    object.save
    object
  end

#INSTANCE METHODS

  #Adding a song to an artist is done by calling #add_song on an instance of the
  #Artist class
  def add_song(song)
    # only assigns artist to song if it doesn't already have an artist
    if song.artist == nil
      #assigns current artist to the song's artist property
      song.artist = self
    end

    #only add the song to the artist's list if it doesn't exist
    if !self.songs.any? {|artist_song| artist_song.name == song.name }
      self.songs << song
    end
  end

  #genres methods returns a collection of genres for an artist's songs
  def genres
    genres_array = self.songs.collect {|song| song.genre}
    genres_array.uniq
  end

end
