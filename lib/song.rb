#####initialize with #name
#accepts a name for the song
#####name=
#sets the song name
#####.all
#returns the class variable @@all
#####.destroy_all
#resets the @@all class variable to an empty array
#####save
#adds the song instance to the @@all class variable
#####.create
#initializes and saves the song

class Song

#####Concerns::Findable
#defines a module Concerns::Findable
#adds a find_by_name class method to classes that are extended by the module
#adds a find_or_create_by_name class method to classes that are extended by the module
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(song_name)
    Song.new(song_name).save
  end

#####artist=
#accepts an artist for the song
#adds the song to the artist's songs
  def artist=(artist)
    @artist = artist
    artist.songs << self
    artist.add_song(self)
  end

#####genre=
#accepts an genre for the song
#adds the song to the genre's songs
#does not add the song to the genre's songs if it already exists
  def genre=(genre)
    @genre = genre
    genre.songs << self unless
    genre.songs.include?(self)
  end

#####.find_by_name
#finds a song instance in @@all by the name property of the song
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

#####.find_or_create_by_name
#finds or creates a song by name maintaining uniqueness of objects by their name property
  def self.find_or_create_by_name(name)
      if song = self.all.find { |song| song.name == name }
    else
      song = self.new(name)
      song.save
    end
    song
  end

#####Song.new_from_filename
#initializes a song based on the filename delimiters
#maintains unique objects
#####Song.create_from_filename                                                                                                                                               
#initializes and saves a song based on the filename delimiters
#maintains unique objects
  def self.new_from_filename(filename)
    song = filename.split(" - ")[1]

    artistname = filename.split(" - ")[0]
    artist = Artist.find_or_create_by_name(artistname)

    genre = filename.split(" - ")[2].gsub(".mp3", "")
    genre = Genre.find_or_create_by_name(genre)

    self.new(song, artist, genre).save
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end
