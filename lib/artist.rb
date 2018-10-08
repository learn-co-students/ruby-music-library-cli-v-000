require 'pry'

class Artist

  attr_accessor :name
  @@all = Array.new

  def initialize(name)
    @name = name
    @songs = Array.new
    @genres = Array.new
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
      if @songs.include?(song) == false
        @songs << song
      end
    end
  end

#  def genres=(genre)
#    if @genres.include?(genre) == false
#      @genres << genre
#    end
#  end

  def genres

    all_songs = self.songs 

    if all_songs.empty? == false
      all_songs.each do |song|
        @genres << song.genre
      end
    end
    @genres

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
