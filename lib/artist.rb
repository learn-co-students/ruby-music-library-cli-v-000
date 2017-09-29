require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all=[]

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

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def save
    self.class.all << self
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    @songs<< song unless @songs.include?(song)
  end

  def songs
    @songs
  end

  def genres
    genre_of_artist =[]
    @songs.each do |song|
      genre_of_artist<<song.genre
    end
    genre_of_artist.uniq

  end
end

