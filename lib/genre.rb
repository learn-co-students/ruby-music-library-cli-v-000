require 'pry'

class Genre
  extend Concerns::Findable 
  attr_accessor :name, :song, :songs, :artist, :genres
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    my_artists = []
    songs.each do |song|
      if !my_artists.include?(song.artist)
        my_artists << song.artist
      end
    end
    my_artists
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
    genre = Genre.new(name)
    genre.save
    genre
  end

end
