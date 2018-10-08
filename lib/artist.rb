require 'pry'

class Artist

  attr_accessor :name
  @@all = Array.new

  def initialize(name)
    @name = name
    @songs = Array.new
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if @songs.include?(song) == false
        @songs << song
    end
    @songs
  end


  def genres
    genres = Array.new
    @songs.each do |song|
      genres << song.genre
    end
    genres.uniq
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

  def self.create(name)
    new_artist = Artist.new(name)
    @@all << new_artist
    new_artist
  end
end
