class Genre

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []  #creates a 'songs' property set to an empty array (genre has many songs)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name) #creates new instances
    new_genre = new(name)
    new_genre.save #invokes .save on that instance
    new_genre
  end

#relationship with class Song
  # Genres have many songs and are initialized with an empty list of songs.
  # Songs have one genre.
  # Songs can be initialized with an optional genre argument.

#relationships with class Artist
  # Genres have many artists through their songs. Implement an #artists method for this association.

  def artists #returns a collection of artists for all of the genre's songs (genre has many artists through songs)
    #does not return duplicate artists if the genre has more than one song by a particular artist (genre has many artists through songs)
    #collects artists through its songs instead of maintaining its own @artists instance variable (genre has many artists through songs)
    songs.collect do |the_song|
      the_song.artist
    end.uniq
  end

end
