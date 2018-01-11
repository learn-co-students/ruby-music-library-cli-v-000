require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
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
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)

    # song.artist == nil ? song.artist = self : song.artist
    # !(self.songs.include?(song)) ? self.songs << song : self.songs
    # song.artist
  end

  def genres
    genres_array = []
    self.songs.each do |song|
      genres_array << song.genre
    end
    genres_array.uniq
  end

  def self.destroy_all
    self.all.clear
  end
end
