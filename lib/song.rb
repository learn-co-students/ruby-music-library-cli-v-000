require 'pry'

class Song

  @@all = [ ]

  attr_accessor :name
  attr_reader :artist

  def initialize(name, artist = nil)
    @name = name
    @artist = artist
  end

  def self.all #had to fix - forgot self
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self #had to fix -- forgot self.class
  end

  def self.create(name) #had to fix - the problem was it wanted me to return the created instance.
    song = self.new(name)
    song.save
    song
  end

  def artist=(arty)
    #self.artist = arty # IS THIS THE DANG PROBLEM??  THIS SAYS STACK LEVEL TOO DEEP -- this is where the loop is happening??
    @artist = arty

  #  self.artist.add_song(self)
  end

end
