class Genre
  attr_accessor :name #attribute accessor (getter and setter)
  attr_reader :songs
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
    song.genre = self unless song.genre == self #calls song's setter method for artist unless it's already set to this artist
  end

  def artists
    songs.collect{ |song| song.artist }.uniq #collects the artists of all the songs in the array through iterating a block, then chaining uniq to get rid of all duplicates in the return array
  end

    #-------CLASS METHODS-------
  def self.create(name)
    genre = self.new(name) #Creates a new instance of self class (Song)
    genre.save
    genre #Implicitly returns song instance
  end

  def self.all
    @@all #Implicitly returns class array
  end

  def self.destroy_all
    @@all.clear #Empties class array
  end

end