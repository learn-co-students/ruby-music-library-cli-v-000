class Genre
  extend Concerns::Findable
  attr_accessor :name #retrieves the name of a genre, can set the name of the genre

  @@all = [] #@@all is initialized as an empty array

  def initialize(name) #accepts a name for the new genre
    @name = name
    @songs = []  #creates a 'songs' property set to an empty array (genre has many songs)
  end

  def songs
    @songs
  end

  def artists
    songs.collect {|song| song.artist}.uniq #collect genres songs, returns a collection of artists for all of the gren's songs (genre has many artis through songs)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save  #adds the Genre instance to the @@all class variable
    @@all << self
  end

  def self.create(created_genre) #initializes and saves the genre
    genre = new(created_genre) #initializes
    genre.save  #saves
    genre
  end
end
