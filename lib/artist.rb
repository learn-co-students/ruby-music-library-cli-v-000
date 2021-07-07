require 'pry'
class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    genre_collection = []
    self.songs.each do |song|
      if !genre_collection.include?(song.genre)
        genre_collection << song.genre
      end
    end
    genre_collection
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end

    if !self.songs.include?(song)
      self.songs << song
    end
  end


  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def self.all
    @@all
  end

end
