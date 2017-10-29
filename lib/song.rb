class Song

  attr_accessor :name
  attr_reader :artist, :genre
#is initialized as an empty array
  @@all = []
#accepts a name for the new song, optional second argument, Artist to be assigned the song's 'artist' property (artist has many songs), optional third argument, Genre to be assigned the song's 'genre property' (song belongs to genre)
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
#assigns an artist to the song (song belongs to artist)
  def artist=(artist)
    @artist = artist
#invokes Artist#add_song to add itself to artist's collection of songs (artist has many songs)
    artist.add_song(self)
  end

  def genre=(genre)
#assigns a genre to the song (song belongs to genre)
    @genre = genre
#adds the song to the genre's collection of songs (genre has many songs), does not add if genre's collection of songs already exists
    genre.songs << self unless genre.songs.include?(self)
  end
#returns the class variable @@all
  def self.all
    @@all
  end
#resets the @@all class variable to an empty array
  def self.destroy_all
    @@all.clear
  end
#save adds the Song instance to the @@all class variable
  def save
    @@all << self
  end
#initializes and saves the song
  def self.create(name)
    Song.new(name).tap{ |s| s.save}
  end

  def self.find_by_name(name)
#finds a song instance in @@all by the name property of the song
    @@all.find{|song| song.name == name}
  end
#returns (not recreates) existing song with provided name if one exists in @@all
  def self.find_or_create_by_name(name)
#invokes .find_by_name(name) OR .create(name) instead of re-coding
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
#split up the filename into corresponding parts
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1]
#gsub off the unneeded .mp3
    genre_name = parts[2].gsub(".mp3", "")

#invokes the appropriate findable methods so as to avoid duplicate objects
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

#initializes a song based on passed-in filename
    Song.new(song_name, artist, genre)
  end

#initializes and saves a song based on passed-in filename
  def self.create_from_filename(filename)
#invokes .new_from_filename instead of re-coding same functionality
    new_from_filename(filename).tap{ |song| song.save}
  end
end
