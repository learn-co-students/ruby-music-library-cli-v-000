class Artist
  
  # extends the Concerns::Findable module
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :song

  # @@all is initialized as an empty array
  @@all = [ ]
  
  def initialize(name)
    # accepts a name for the new artist
    # retrieves the name of an artist
    # name= can set the name of a song
    @name = name
    
    # creates a 'songs' property set to an empty array (artist has many songs)
    @songs = [ ]
  end
  
  def self.all
    # returns the class variable @@all
    @@all
  end
  
  def self.destroy_all
    # resets the @@all class variable to an empty array
    @@all.clear
  end
  
  def save
    # adds the Artist instance to the @@all class variable
    @@all << self
  end
  
  def self.create(name)
    # custom constructor: initializes, saves, and returns the song    
    artist = self.new(name)
    artist.save
    artist
  end
  
  def songs
    # returns the artist's 'songs' collection (artist has many songs)
    @songs
  end
  
  def add_song(song)
    # assigns the current artist to the song's 'artist' property (song belongs to artist)
    # does not assign the artist if the song already has an artist
    song.artist = self unless song.artist
    
    # adds the song to the current artist's 'songs' collection
    # does not add the song to the current artist's collection of songs if it already exists therein
    @songs << song unless songs.include?(song)
  end
  
  def genres
    # returns a collection of genres for all of the artist's songs (artist has many genres through songs)
    # does not return duplicate genres if the artist has more than one song of a particular genre (artist has many genres through songs)
    #collects artists through its songs instead of maintaining its own @artists instance variable (genre has many artists through songs)
    songs.collect(&:genre).uniq
  end
  
end