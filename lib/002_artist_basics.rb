require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name, :song

@@all = []

  def initialize(name)
    @name = name
    save
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
    Artist.new(name)
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
  end
end

  def genres
  genres_array = @songs.collect do |song|
    song.genre
  end
    genres_array.uniq
  end

# rspec spec/006_artists_and_genres_spec.rb
end
