class Genre

  extend Concerns::Findable

  #name retrieves the name of a genre, name= can set the name of a genre
  #songs returns the genre's 'songs' collection
  #artists returns a collection of artists for all of the genre's songs

  attr_accessor :name, :songs

  #@@all is initialized as an empty array

  @@all = []

  #initialize accepts a name for the new genre
  # Genre #initialize creates a 'songs' property set to an empty array
  # initialize can be invoked with an optional third argument, a Genre object to be assigned to the song's 'genre' property

  def initialize(name)
    @name = name
    @songs = []
  end

  #.all returns the class variable @@all

  def self.all
    @@all
  end

  #.destroy_all resets the @@all class variable to an empty array

  def self.destroy_all
    self.all.clear
  end

  #save adds the genre instance to the @@all class variable

  def save
    @@all << self
  end

  #.create initializes and saves the genre

  def self.create(name)
    new_genre = Genre.new(name).tap do |genre|
      genre.save
    end
  end

  # #artists returns a collection of artists for all of the genre's songs (genre has many artists through songs)
  # does not return duplicate artists if the genre has more than one song by a particular artist (genre has many artists through songs)
  # collects artists through its songs instead of maintaining its own @artists instance variable (genre has many artists through songs)

  def artists
    self.songs.collect {|song| song.artist }.uniq
  end

end
