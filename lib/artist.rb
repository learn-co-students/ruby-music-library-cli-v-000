class Artist
  extend Concerns::Findable                         # extends the Concerns::Findable module

  attr_accessor :name                               # accepts a name for the new artist / retrieves the name of an artist
  attr_reader :songs
  @@all = []                                        # is initialized as an empty array

  def initialize(name)                              # accepts a name for the new artist / retrieves the name of an artist
    @name = name                                    # can set the name of an artist
    @songs = []                                     # creates a 'songs' property set to an empty array (artist has many songs)
  end

  def self.all                                      # returns the class variable @@all
    @@all
  end
  def self.destroy_all                              # resets the @@all class variable to an empty array
    @@all.clear
  end
  def self.create(name)                             # initializes and saves the artist
    new(name).tap{ |a| a.save }
  end

  def save                                          # adds the Artist instance to the @@all class variable
    @@all << self
  end
  def songs                                         # returns the artist's 'songs' collection (artist has many songs)
    @songs
  end
  def add_song(song)
    song.artist = self unless song.artist           # assigns the current artist to the song's 'artist' property (song belongs to artist) / does not assign the artist if the song already has an artist
    songs << song unless songs.include?(song)       # adds the song to the current artist's 'songs' collection / does not add the song to the current artist's collection of songs if it already exists therein
  end
  def genres
    songs.collect { |song| song.genre }.uniq        # returns a collection of genres ; does not return duplicate genres ; collects genres through its songs
  end
end
