require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :song, :genres, :genre
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    my_genres = []
    songs.each do |song|
      if !my_genres.include?(song.genre)
      my_genres << song.genre
      end
    end
    my_genres
  end

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
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !self.songs.include?(song)
      songs << song
    end
  end


end
