require 'pry'

class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
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

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    #doesnt add the song to the current artist's collection of songs if it already exists within.
    exists = @songs.detect {|x| x == song }
    if exists == nil
      @songs << song  #adds a song object to the songs array within this artist instance.
      song.assign_to_artist=(self)
    end
  end

  def songs
    @songs
  end

  def genres
    all_genres = []
    @songs.each do |song|
      all_genres << song.genre
    end
    unique_genres = all_genres.uniq
    unique_genres
  end
end
