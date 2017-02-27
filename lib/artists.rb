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
    genlist = [] #local var, cleared each time .genres is invoked.
    @songs.each {|song| genlist << song.genre if !genlist.include?(song.genre)} #neater, but I'm not sure it's more readable.
    genlist
  end

  def save
    @@all << self
  end

  def add_song(song)
    @songs << song if !self.songs.include?(song) #one-liners but kinda awkward/unreadable. :/
    song.artist = self if song.artist == ""
  end

  def self.create(name) #creates new artist by name and saves to Artist's @@all array.
    new_artist = Artist.new(name) #self.new also works. I guess self = Artist, dunno wtf self.class means then...
    new_artist.save
    return new_artist
  end

end
