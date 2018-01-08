#Song class
module SongArtists
  module InstanceMethods
    def save
      self.class.all<<self
    end
  end

  module ClassMethods

    def create(name)
      new_instance = self.new(name)
      new_instance.save
      self.all[0]
    end

    def destroy_all
      self.all.clear
    end
  end
end

class Song
  attr_accessor :name, :genre
  include SongArtists::InstanceMethods
  extend SongArtists::ClassMethods

  @@all = []

  def initialize(name, genre = "", artist = self.artist)
    @name = name
    @genre = genre
    @artist = artist
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def artist
    if @artist!=nil
      @artist
    else
      return nil
    end
  end

end

#artist class
class Artist
  attr_accessor :name, :songs
  include SongArtists::InstanceMethods
  extend SongArtists::ClassMethods

  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = []

  def self.all
    @@all
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !self.songs.include?(song)
      self.songs << song
    end
  end
end

#Genre class
class Genre
  attr_accessor :name
  attr_reader :songs
  include SongArtists::InstanceMethods
  extend SongArtists::ClassMethods

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def songs=(song)
    if !@songs.include?(song)
      @songs<<song
    end
  end
end
