class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
#is initialized as an empty array
  @@all = []
#accepts a name for the new genre
  def initialize(name)
    @name = name
#creates song property set to empty array (genre has many songs)
    @songs = []
  end
#returns the class variable @@all
  def self.all
    @@all
  end
#resets the @@all class variable to an empty array
  def self.destroy_all
    @@all.clear
  end
#adds the Genre instance to the @@all class variable
  def save
    @@all << self
  end
#initializes and saves the genre
  def self.create(name)
    Genre.new(name).tap { |g| g.save}
  end
#returns a collection of artists for all of the genre's songs (genre has many artists)
  def artists
#collects artists through its songs instead of maintaining its own @artists instance variable (genre has many artists through songs)
    songs.collect{|song| song.artist}.uniq
  end
end
