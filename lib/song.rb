require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :genre, :artist #Only needs to be able to read the genre and artist.
  @@all = []

  def initialize(name, artist = nil, genre = nil) #Must pass in the name argument, artist and genre are optional (and thus, defaulted at nil)
    @name = name
    if artist #If an artist argument is given, then set self.artist to that artist passed in.
      self.artist = artist
    if genre
      self.genre = genre
    end
    end
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) #Calling on the Artist Class Method (add_song). Creates an association btw the two - pass in the instance of self and know the artist class will know about this song.
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self) #This method is doing the same thing as the Artist= method except I don't have a add_song method built out in the genre class so I just had to recreate that logic here.
  end

  def self.create (name, artist = nil, genre = nil) #Create new instance with following parameters (set Artist and Genre to nil if they are not given. Name argument MUST be passed in.)
    song = Song.new(name, artist, genre)
    song.save
    song
    #Song.new(name, artist, genre).tap{|song| song.save} #Tap allows me to 'tap into' the method chain and saves the song with the following info (the arguments given)
  end

  def self.new_from_filename(filename) #This is a difficult method bc I need to get the MP3 file and split up its components and save each according (Artist, Song name, Genre) Then .chomp removes the ".mp3" ending from the file
    #The file is split up by '-' so just call .split and have it divided up whenever there is a dash
    separated_file = filename.chomp(".mp3").split(" - ")
    artist_name, song_name, genre_name = separated_file
    artist_name = separated_file[0] #Artist is listed first in the array (so its at index 0)
    song_name = separated_file[1]
    genre_name = separated_file[2]
    artist = Artist.find_or_create_by_name(artist_name) #Find the artist if already created (create the new artist object if that artist is not created yet).
    genre = Genre.find_or_create_by_name(genre_name) #Find the genre if already created (create the new genre object if that genre category is not created yet).
    self.new(song_name, artist, genre) #New instance instantiated (.new) with the paraments of the local artist and genre variables you just created (that called on the find or create by methods) and the song_name local var that is just set to the song_name that was passed in (the song_name at the index [1])
  end

  def self.create_from_filename(filename) #saves (pushes into the @@all array) the newly created instance by the passed in filename. Call on the new_from_filename method so that you don't have to retype that code inside this method.
    @@all << self.new_from_filename(filename)
  end
end
