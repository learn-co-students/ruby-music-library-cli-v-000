class Genre
extend Concerns::Findable                          # extends the Concerns::Findable module

  attr_accessor :name
  @@all = []                                       # is initialized as an empty array

  def initialize(name)                             # accepts a name for the new artist / retrieves the name of an artist
    @name = name                                   # can set the name of a genre
    @songs = []                                    # creates a 'songs' property set to an empty array (genre has many songs)
  end

  def self.all                                     # returns the class variable @@all
    @@all
  end
  def self.destroy_all                             # resets the @@all class variable to an empty array
    @@all.clear
  end
  def self.create(name)                            # initializes and saves the genre
    genre = new(name)
    genre.save
    genre
  end

  def save                                         # adds the Genre instance to the @@all class variable
    @@all << self
  end
  def songs                                        # returns the genre's 'songs' collection (artist has many songs)
    @songs
  end
  def add_song(song)
    song.genre = self unless song.genre
    songs << song unless songs.include?(song)
  end
  def artists
    songs.collect { |song| song.artist }.uniq      # returns a collection of genres ; does not return duplicate genres ; collects genres through its songs
  end
end
