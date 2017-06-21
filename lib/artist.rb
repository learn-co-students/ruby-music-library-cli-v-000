require 'pry'

class Artist
  attr_accessor :name, :songs, :artist, :song, :genre
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

  def save
    @@all << self
  end

  def self.create(name)
    new(name).tap{|a| a.save}
  end

  def add_song(song)
    @songs << song unless songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    binding.pry
    Song.genre.all
  end
end
# #genres
#     returns the unique genres belonging to all the songs of the artist (FAILED - 1)
# Failures:
#   1) Artists have many genres through songs #genres returns the unique genres belonging to all the songs of the artist
#      Failure/Error: expect(artist.genres).to include(genre)
#      NoMethodError:
#        undefined method `genre' for Song:Class
#      # ./lib/artist.rb:34:in `genres'
#      # ./spec/006_artists_and_genres_spec.rb:11:in `block (3 levels) in <top (required)>'
# Finished in 0.07806 seconds (files took 0.52967 seconds to load)
# 35 examples, 1 failure
# Failed examples:
# rspec ./spec/006_artists_and_genres_spec.rb:5 # Artists have many genres through songs #genres returns the unique genres belon
#  the artist
