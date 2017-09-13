require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil) #invokes #artist= instead of simply assigning to an @artist instance variable to ensure that associations are created upon initialization; invokes #genre= instead of simply assigning to a @genre instance variable to ensure that associations are created upon initialization"
    @name = name
    self.artist = artist if artist #Songs belong to an artist
    self.genre = genre if genre #Songs have one genre
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

  def self.create(song) #creates new instances
    new_song = self.new(song)
    new_song.save #invokes .save on that instance
    new_song
  end

#relationships with class Artist
  #Songs belong to an artist and an artist has many songs.
  #Adding a song to an artist by called add_song on Artist class
  #Songs initialized with optional artist argument (artist=nil)

  def artist=(artist) #assigns an artist to the song (song belongs to artist)
    @artist = artist #artist is reading from Song class artist method(reader)
    artist.add_song(self) #invokes Artist#add_song to add itself to the artist's collection of songs (artist has many songs)
  end

#relationship with class Genres
  # Genres have many songs and are initialized with an empty list of songs.
  # Songs have one genre.
  # Songs can be initialized with an optional genre argument (genre=nil)

  def genre=(genre)
    @genre = genre #assigns a genre to the song (song belongs to genre)
    genre.songs << self unless genre.songs.include?(self) #adds the song to the genre's collection of songs (genre has many songs); does not add the song to the genre's collection of songs if it already exists therein
  end

#FINDABLEs

  def self.find_by_name(name) #finds a song instance in @@all by the name property of the song
    all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name) #returns (does not recreate) an existing song with the provided name if one exists in @@all, invokes .find_by_name instead of re-coding the same functionality, creates a song if an existing match is not found, invokes .create instead of re-coding the same functionality
    find_by_name(name) || create(name)
  end

#relationship with MusicImporter

  def self.new_from_filename(filename) #passed-in the normalized file name from MusicImporter files method ([Action Bronson - Larry Csonka - indie.mp3, "Jurassic 5....."]) #now we have to parse this file name.
    parsed_filename = filename.split(" - ")
    artist_name = parsed_filename[0]
    song_name = parsed_filename[1]
    genre_name = parsed_filename[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name) #invokes the appropriate Findable methods so as to avoid duplicating objects
    genre = Genre.find_or_create_by_name(genre_name) #invokes the appropriate Findable methods so as to avoid duplicating objects

    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename) #initializes and saves a song based on the passed-in normalized filename"
    new_from_filename(filename).tap {|song| song.save} #invokes .new_from_filename instead of re-coding the same functionality.
  end

end
