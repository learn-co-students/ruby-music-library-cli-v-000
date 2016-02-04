require_relative '../lib/concerns/findable.rb'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    @@all << artist.save
  end

  def add_song(song)
   if song.artist != self
      @songs << song
      song.artist = self
    end
    if @songs.include?(song) == false
      @songs << song
    end
  end

  def genres
    genre_array = []
    self.songs.collect do |song|
      song.genre
      genre_array << song.genre
    end
    genre_array.uniq
  end
end