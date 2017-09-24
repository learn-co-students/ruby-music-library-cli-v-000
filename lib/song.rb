require 'pry'

# require_relative './concerns/findable'
class Song
  @@all = []

  attr_accessor :name, :artist, :genre

  # extend Concerns::Findable
  # initializes with name, optional artist, genre
  def initialize(name, artist=nil, genre=nil)
    @name = name
    # @genre = genre
    self.genre = genre if genre
    self.artist = artist if artist
  end
  # returns all instances of the Song class
  def self.all
    @@all
  end
  # saves and instance of the song class and returns that instance
  def save
    @@all << self
    self
  end
  # empties all instances from @@all
  def self.destroy_all
    self.all.clear
  end
  # instantiates a new song with a name, the saves the instance to @@all
  def self.create(name)
    self.new(name).tap {|s| s.save}
    # song = self.new(name)
    # song.save
  end
  # Sets the song's artist and adds the song to that artist's @songs collection
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end
  # Searches through all the created Song objects and returns those of a particular name
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  # Searches through all created Song objects, and if finds song/s of a particular name, returns them. If not, creates a new instance and saves to @@all
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end
  # Getter method for genre. NEEDED?
  def genre
    @genre
  end
  # Custom setter method that sets a song's genre and then adds the song object to the genre's collection of @songs
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  # creates an array from a filename of artist, song, and genre (.mp3)
  # Tries to find the song using a name of type string, returns the object if found; if not creates a new object and saves to @@all
  # Takes the artist string from array and finds or creates a new Artist instance, then sets that song to the artist's @song and adds it to his or her @@song array.
  # Does the same as above for genre, but also removes the .mp3 from the end
  # returns the new song instance
  def self.new_from_filename(some_filename)
    f = some_filename.split(" - ")
    song = self.find_or_create_by_name(f[1])
    song.artist_name = f[0]
    song.genre = Genre.find_or_create_by_name(f[2].gsub(/\.mp3/, ""))
    song
  end

  def self.create_from_filename(filename)
    f = filename.split(" - ")
    song, artist, genre = f[1], f[0], f[2].gsub(/\.mp3/, "")
    new_song = Song.find_or_create_by_name(song)
    new_song.artist_name = artist
    new_song.genre = Genre.find_or_create_by_name(genre)
    self.all << new_song
    new_song
  end

  def artist_name=(name)
    new_artist = Artist.find_or_create_by_name(name)
    new_artist.add_song(self)
  end

end
