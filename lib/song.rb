class Song
  attr_accessor :name                               # retrieves the name of a song / can set the name of a song
  attr_reader :artist, :genre                       # returns the artist of the song (song belongs to artist) / returns the genre of the song (song belongs to genre)
  @@all = []                                        # is initialized as an empty array

  def initialize(name, artist = nil, genre = nil)   # accepts a name for the new song / can be invoked with an optional second argument, an Artist object to be assigned to the song's 'artist' property (song belongs to artist) / can be invoked with an optional third argument, a Genre object to be assigned to the song's 'genre' property (song belongs to genre)
    @name = name                                    # retrieves the name of a song / can set the name of a song
    self.artist = artist if artist                  # invokes #artist= instead of simply assigning to an @artist instance variable to ensure that associations are created upon initialization
    self.genre = genre if genre                     # invokes #genre= instead of simply assigning to a @genre instance variable to ensure that associations are created upon initialization
  end

  def self.all                                      # returns the class variable @@all
    @@all
  end
  def self.destroy_all                              # resets the @@all class variable to an empty array
    all.clear
  end
  def self.create(name)                             # initializes and saves the song
    song = new(name)
    song.save
    song
  end
  def self.find_by_name(name)                       # finds a song instance in @@all by the name property of the song
    all.detect{ |s| s.name == name }
  end
  def self.find_or_create_by_name(name)             # returns (does not recreate) an existing song with the provided name if one exists in @@all / creates a song if an existing match is not found
    find_by_name(name) || create(name)              # invokes .find_by_name instead of re-coding the same functionality / invokes .create instead of re-coding the same functionality
  end
  def self.new_from_filename(filename)              # initializes a song based on the passed-in filename
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)     # invokes the appropriate Findable methods so as to avoid duplicating objects
    genre = Genre.find_or_create_by_name(genre_name)        # invokes the appropriate Findable methods so as to avoid duplicating objects
    new(song_name, artist, genre)
  end
  def self.create_from_filename(filename)           # initializes and saves a song based on the passed-in filename
    new_from_filename(filename).tap{ |s| s.save }   # invokes .new_from_filename instead of re-coding the same functionality
  end

  def artist=(artist)
    @artist = artist                                # assigns an artist to the song (song belongs to artist)
    artist.add_song(self)                           # invokes Artist#add_song to add itself to the artist's collection of songs (artist has many songs)
  end
  def genre=(genre)
    @genre = genre                                  # assigns a genre to the song (song belongs to genre)
    genre.songs << self unless genre.songs.include?(self)   # adds the song to the genre's collection of songs (genre has many songs) / does not add the song to the genre's collection of songs if it already exists therein
  end

  def save                                          # adds the Song instance to the @@all class variable
    self.class.all << self
  end

end
