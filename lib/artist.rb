require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = [] #keeps track of all artists ever created

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(artist_name) #initializes an instance then pushes that instance into the @@all array.
    song = Artist.new(artist_name)
    song.save
    song
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self unless song.artist != nil
    song.artist.songs << song unless @songs.include?(song)
  end


end
