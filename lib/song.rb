class Song

  extend Concerns::Findable

  #name retrieves the name of a song, name= can set the name of a song
  # Song #genre returns the genre of the song

  attr_accessor :name, :artist, :genre

  #@@all is initialized as an empty array

  @@all = []

  #initialize accepts a name for the new song, #initialize can be invoked with an optional second argument, an Artist object to be assigned to the song's 'artist' property, invokes #artist= instead of simply assigning to an @artist instance variable to ensure that associations are created upon initialization
  #Song #initialize can be invoked with an optional third argument, a Genre object to be assigned to the song's 'genre' property
  #initialize invokes #genre= instead of simply assigning to a @genre instance variable to ensure that associations are created upon initialization

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
  end

  #.all returns the class variable @@all

  def self.all
    @@all
  end

  #.destroy_all resets the @@all class variable to an empty array

  def self.destroy_all
    self.all.clear
  end

  #save adds the Song instance to the @@all class variable

  def save
    @@all << self
  end

  #.create initializes and saves the song

  def self.create(name)
    new_song = Song.new(name).tap do |song|
      song.save
    end
  end

  # artist= assigns an artist to the song (song belongs to artist)
  # invokes Artist#add_song to add itself to the artist's collection of songs (artist has many songs)

  def artist=(artist)
    @artist = artist
    if artist.class == Artist
      artist.add_song(self)
    end
  end

  #genre= assigns a genre to the song
  # Song #genre= adds the song to the genre's collection of songs
  #genre= does not add the song to the genre's collection of songs if it already exists therein

  def genre=(genre)
    @genre = genre
    if genre.class == Genre
      genre.songs << self unless genre.songs.include?(self)
    end
  end

  # initializes a song based on the passed-in filename
  # invokes the appropriate Findable methods so as to avoid duplicating objects

  def self.new_from_filename(filename)
    artist, song, genre = filename.slice(0..-5).split(" - ")
    new_song = self.find_or_create_by_name(song)
    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song.genre = Genre.find_or_create_by_name(genre)
    new_song
  end

  # initializes and saves a song based on the passed-in filename
  # invokes .new_from_filename instead of re-coding the same functionality

  def self.create_from_filename(filename)
    new_song_from_file = self.new_from_filename(filename)
    new_song_from_file.save
  end

end
