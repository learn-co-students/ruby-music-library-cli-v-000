require_relative "concerns/findable.rb"

class Artist
  attr_accessor :name, :songs

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def save
    @@all << self
  end

  def add_song(song)
    if song.artist.nil?
      song.artist = self
    end
    if song.artist == self and !songs.include?(song)
      songs << song
    end
  end

  def genres
    genre_collection = []
    @songs.each do |song|
      if !genre_collection.include?(song.genre)
        genre_collection << song.genre
      end
    end
    genre_collection
  end
end
