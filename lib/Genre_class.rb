class Genre
  extend Concerns::Findable
  #can set a name for the new genre and can retrieve the name of the genre
  attr_accessor :name

  @@all = []

  def initialize(name)
    #accepts a name for the new genre
    # creates a "songs" property set to an empty array (genre has many songs)
    @name = name
    @songs = []
  end

  def self.all
    # returns the class variable @@all
    @@all
  end

  def self.destroy_all
    #resets the @@all class variable to an empty array
    self.all.clear
  end

  def save
    # adds the Genre instance to the @@all class variable
    @@all << self
  end

  def self.create(name)
    # initializes and saves the genre
    genre = Genre.new(name)
    genre.save
    genre
  end

  def songs
    # returns the genre's 'songs' collection (genre has many songs)
    @songs
  end

  def artists
    # returns a collection of artists for all of the genre's songs (genre has many artists through songs)
    # does not return duplicate artists if the genre has more than one song by a particular artist
    # (genre has many artists through songs)
    # collects artists through its songs instead of maintaining its own @artists instance variable
    # (genre has many artists through songs)
    artist_collection = []
    self.songs.each { |song| artist_collection << song.artist unless artist_collection.include?(song.artist) }
    artist_collection
  end

end
