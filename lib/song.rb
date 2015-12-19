require_relative "../concerns/findable.rb"

class Song
  extend Concerns::Findable
  attr_accessor :name #attribute accessor (getter and setter)
  attr_reader :artist, :genre
  @@all = [] #Class variable array that keeps track of all instances

  #-------INSTANCE METHODS-------
  def initialize(name, artist=nil, genre=nil) #Initialize method - invoked when instantiated
    @name = name #Instance variable - local to instances
    self.artist = artist if artist != nil #Only set if not nil because it calls the setter method below with self.artist=
    self.genre = genre if genre != nil
  end

  def save
    @@all << self #Loads instance into class array
  end

  def artist=(artist) #Setter method for @artist
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre) #Setter method for @genre
    @genre = genre
    genre.add_song(self)
  end

  #-------CLASS METHODS-------
  def self.create(name)
    song = self.new(name) #Creates a new instance of self class (Song)
    song.save
    song #Implicitly returns song instance
  end

  def self.all
    @@all #Implicitly returns class array
  end

  def self.destroy_all
    @@all.clear #Empties class array
  end

end