require_relative "../concerns/findable.rb"

class Artist
  extend Concerns::Findable #extends rather than includes module to treat as class methods
  attr_accessor :name, :songs #attribute accessor (getter and setter)
  @@all = [] #Class variable array that keeps track of all instances

  #-------INSTANCE METHODS-------
  def initialize(name) #Initialize method - invoked when instantiated
    @name = name #Instance variable - local to instances
    @songs = []
  end

  def save
    @@all << self #Loads instance into class array
  end

  def add_song(song)
    @songs << song unless @songs.include?(song) #adds song to array unless it's already in it to prevent infinite recursion
    song.artist = self unless song.artist == self #calls song's setter method for artist unless it's already set to this artist
  end

  def genres
    songs.collect{ |song| song.genre }.uniq #collects the genres of all the songs in the array through iterating and applying the block, then chaining uniq to get rid of all duplicates in the return array
  end

  #-------CLASS METHODS-------
  def self.create(name)
    artist = self.new(name) #Creates a new instance of self class (Song)
    artist.save
    artist #Implicitly returns song instance
  end

  def self.all
    @@all #Implicitly returns class array
  end

  def self.destroy_all
    @@all.clear #Empties class array
  end

end