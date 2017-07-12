

require_relative './concerns/findable.rb'

class Artist
  #lets import the finable module using extend because it is class methods
  extend Concerns::Findable
  attr_accessor :name   #setter and getter instance methods
  @@all = []   #an array to keep track of all created instances of Song class



  def initialize(name)
    @name = name
    @@all << self
    @songs = []

  end

  #class method to display all instances created under Class
  def self.all
    @@all
  end
  #delete all saved instances of an array
  def self.destroy_all
    @@all = []
  end
  def save
    @@all << self
  end
  #lets initialize a new song as a variable, and then set that variable to save in the array, (make sure you return the new instance object)
  def self.create(name)
    song = self.new(name)
    self.all << song
    song
  end
  #method to return the list of songs for the artist
  def songs
    @songs
  end
  def add_song(song)
    #add the argument to the songs array only if the song does not already exist in the array
        @songs << song      if    @songs.include?(song) == false
    #assocate the artist (self) to the song (aong has an attr_accessor for artist) only if it has not already been setup
        song.artist = self  if    song.artist != self
  end
  def genres
    self.songs.collect {|song| song.genre}
    .uniq   #this methood creates an array without duplicates, the .uniq is acted on the array that is generated above
  end

end
