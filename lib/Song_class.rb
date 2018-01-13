class Song
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable


  #Holds every instance of the class created
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    #Class instance instantiates with the name of the song
    # invokes Artist#add_song to add itself to the artist's collection of songs (artist has many songs)
    # can be invoked with an optional third argument, a Genre object to be assigned to the song's genre property (song belong to Genre)
    @name = name
    # only adds a self.artist if artist exists.
    self.artist = artist if artist
    self.genre = genre if genre
    @artists = []
  end

  def self.all
    #returns the array holding every instance of the class
    @@all
  end

  def self.destroy_all
    #clears the array that hold every instance of the class
    @@all.clear
  end

  def save
    #adds a new song to the class variable holding every instance of the class in an array.
    @@all << self
  end

  def self.create(name)
    #Self constructor that creates a new song, saves it to the @@all array, and returns the new song
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    #assigns the artist argument to the artist class variable.
    #pulls the add_song method from the Artist class and adds self.
    #returns @artist
    @artist = artist
    @artist.add_song(self)
    @artist
  end

  def genre=(genre)
    # assigns a genre to the song (song belongs to genre)
    # adds the song to the genre's collection of songs (genre has many songs)
    # does not add the song to the genre's collectin of songs if it already exists therein
    @genre = genre
    @genre.songs << self unless @genre.songs.include?(self)
    @genre
  end

  def self.new_from_filename(filename)
    # initializes a song based on the passed-in filename
    # invokes the appropriate Findable methods so as to avoid duplicating objects
    # The method breaks up the file_name string it receives and turns it into an array minus the -
    # Take each position of the array and store them under a variable
    # create a new Song class and associate it with an Artist class and a Genre class
    break_up_filename = filename.split(" - ")
    break_up_genre = break_up_filename[2].split(".")
    artist = break_up_filename[0]
    name = break_up_filename[1]
    genre = break_up_genre[0]
    # binding.pry
    song = self.find_or_create_by_name(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(filename)
    # initializes and saves a song based on the passed-in filename
    # invokes .new_from_filename instead of re-coding the same functionality
    song = self.new_from_filename(filename)
    song
  end


end
