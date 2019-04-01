class Genre
  
  # extends the Concerns::Findable module
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :song
  
  # @@all is initialized as an empty array
  @@all = [ ]
  
  def initialize(name)
    # accepts a name for the new genre
    # retrieves the name of a genre
    #can set the name of a genre
    @name = name
    
    # creates a 'songs' property set to an empty array (genre has many songs)
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
    # adds the Genre instance to the @@all class variable
    @@all << self
  end
  
  def self.create(name)
    # custom constructor: initializes, saves, and returns the song
    genre = self.new(name)
    genre.save
    genre
  end
  
  def songs
    # returns the genre's 'songs' collection (genre has many songs)
    @songs
  end
  
  def artists
    # returns a collection of artists for all of the genre's songs (genre has many artists through songs)
    # does not return duplicate artists if the genre has more than one song by a particular artist (genre has many artists through songs)
    # collects artists through its songs instead of maintaining its own @artists instance variable (genre has many artists through songs)
    songs.collect(&:artist).uniq
  end
  
  
end