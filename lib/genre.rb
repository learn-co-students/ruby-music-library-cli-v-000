require 'pry'

class Genre
  extend Concerns::Findable
  attr_accessor :name
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
    genre = self.new(name)
    genre.save
    genre
  end

  def save
    self.class.all << self
  end

  def songs
    @songs
  end


  def artists
    genre_artists =[]
    @songs.each do |song|
      genre_artists<<song.artist
    end
    genre_artists.uniq
  end

  def add_song(song)
    @songs<< song
    song.genre = self
  end
end