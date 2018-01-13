require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name

  #Holds every instance of the class created
  @@all = []

  def initialize(name)
    #Class instance instantiates with the name of the artist
    @name = name
    @songs = []
  end

  def self.all
    #returns the array holding every instance of the class
    @@all
  end

  def self.destroy_all
    #clears the array that hold every instance of the class
    @@all.clear
  end

  def save
    #adds a new artist to the class variable holding every instance of the class in an array.
    @@all << self
  end

  def self.create(name)
    #Self constructor that creates a new artist, saves it to the @@all array, and returns the new song
    artist = Artist.new(name)
    artist.save
    artist
  end

  def songs
    #returns the artist's songs by returning the class variable holding all of the songs.
    @songs
  end

  def add_song(song)
    # assigns the current artist to the song's 'artist' property (song belongs to artist)
    # does not assign the artist if the song already has an artist
    # adds the song to the current artist's 'songs' collection
    # does not add the song to the current artist's collection of songs if it already exists therein
    song.artist = self unless song.artist
    @songs << song unless songs.include?(song)
    # song.add_artist(self) I tried to make this to add the artists
    song
    # binding.pry
  end

  def genres
    # returns a collection of genres for all of the artist's songs (artist has many genres through songs)
    # does not return duplicate genres if the artist has more than one song of a particular genre
    # (artist has many genres through songs)
    # collects genres through its songs instead of maintaining its own @genres instance variable
    # (artist has many genres through songs)
    # creates a array variable called collection and adds the genres to it unless it already has the genre
    collection = []
    self.songs.each { |song| collection << song.genre unless collection.include?(song.genre) }
    collection
  end

end
