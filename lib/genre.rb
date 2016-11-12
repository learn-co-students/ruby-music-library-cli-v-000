require 'pry'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    return genre
  end

  def artists
    unique_artists = []
    self.songs.collect do |song|
      unique_artists << song.artist
    end
    unique_artists.uniq
  end

end
