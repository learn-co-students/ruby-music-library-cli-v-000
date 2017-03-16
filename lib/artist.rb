# require 'pry'
# require_relative './song.rb'
require_relative './concerns/findable.rb'

class Artist
  extend Findable

  attr_accessor :name, :songs
  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def initialize(n)
    @name = n
    self.songs = []
  end

  def self.create(n)
    artist = self.new(n)
    @@all << artist
    artist
  end

  def save
    @@all << self
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song) # add song to the instance's songs array unless the current instance's songs array already includes song
    song.artist = self if song.artist == nil # set the artist attribute to self (current instance) if the artist attribute is empty
    song
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

  def self.list_artists
    self.all.each {|artist| puts "#{artist.name}"}
  end

  def list_artist_songs # the similar method for this that I'm creating for Genres could be modularized
    self.songs.each {|song| puts "#{song.song_attributes}"} # iterate over the artist_object's song array and put for each song the song attributes
  end

end
