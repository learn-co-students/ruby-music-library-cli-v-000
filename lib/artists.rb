require 'pry'

class Artist
  attr_accessor :name, :song
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

  def songs
    @songs
  end

  def genres
    genlist = []; @songs.each {|song| genlist << song.genre unless genlist.include?(song.genre)}; genlist #neater, but I'm not sure it's more readable.
  end

  def save
    @@all << self
  end

  def add_song(song) #add to artist's @songs array and sets song's artist to self if there isn't one yet
    @songs << song if !self.songs.include?(song)
    song.artist = self if song.artist == ""
  end

  def self.create(name) #creates new artist by name and saves to Artist's @@all array.
    new_artist = Artist.new(name)
    new_artist.save
    return new_artist
  end

end
