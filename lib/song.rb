class Song
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  # @@all is initialized as an empty array
  @@all = [ ]
  
  # can be invoked with an optional second argument, an Artist object to be assigned to the song's 'artist' property (song belongs to artist)
  # can be invoked with an optional third argument, a Genre object to be assigned to the song's 'genre' property (song belongs to genre)
  def initialize(name, artist = nil, genre = nil)
    # accepts a name for the new song
    # retrieves the name of a song
    # name= can set the name of a song
    @name = name
    
    # invokes #artist= instead of simply assigning to an @artist instance variable to ensure that associations are created upon initialization
    self.artist= artist if artist!=nil
    
    # invokes #genre= instead of simply assigning to a @genre instance variableto ensure that associations are created upon initialization
    self.genre = genre if genre
  end
  
  def self.all
    # returns the class variable @@all
    @@all
  end
  
  def self.destroy_all
    # resets the @@all class variable to an empty array
    @@all.clear
  end
  
  def save
    # adds the Song instance to the @@all class variable
    @@all << self
  end
  
  def self.create(name)
    # custom constructor: initializes, saves, and returns the song
    song = self.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    # assigns an artist to the song (song belongs to artist)
    # returns the artist of the song (song belongs to artist)
    @artist = artist
    
    # invokes Artist#add_song to add itself to the artist's collection of songs(artist has many songs)
    artist.add_song(self)
  end
  
  def genre=(genre)
    # assigns a genre to the song (song belongs to genre)
    # returns the genre of the song (song belongs to genre)
    @genre = genre
    
    # adds the song to the genre's collection of songs (genre has many songs)
    #  does not add the song to the genre's collection of songs if it already exists therein
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    # finds a song instance in @@all by the name property of the song
    @@all.detect{|song| song.name == name}

  end
  
  def self.find_or_create_by_name(name)
    # returns (does not recreate) an existing song with the provided name if one exists in @@all
    # invokes .find_by_name instead of re-coding the same functionality
    # creates a song if an existing match is not found
    # invokes .create instead of re-coding the same functionality
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    # initializes a song based on the passed-in filename
    artist, song, genre = filename.chomp(".mp3").split(" - ")
    
    # invokes the appropriate Findable methods so as to avoid duplicating objects
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    self.new(song, artist, genre)
  end
  
  def self.create_from_filename(filename)
    # initializes and saves a song based on the passed-in filename
    # invokes .new_from_filename instead of re-coding the same functionality
    song = new_from_filename(filename)
    song.save
  end
  
end