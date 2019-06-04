class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil) #Song initializes with a name and optional arguments for artist and genre.
    @name = name
    self.artist = artist if artist #The artist passed in to the method is set to equal self.artist if artist = nil.
    self.genre = genre if genre
  end

  def artist=(artist) #Setter method. Calls the Artist#add_song method to instantiate and save a song instance to the Artist class.
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all #Returns the @@all array above.
    @@all
  end

  def self.destroy_all #Resets the @@all array.
    @@all.clear
  end

  def save #Pushes new song instances into the array.
    @@all << self
  end

  def self.create(name) #Instantiates and saves new songs.
    self.new(name).tap {|song| song.save}
  end

  def self.find_by_name(name) #Iterates through the @@all array and returns the first instance of song that matches the name passed in.
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name) #Finds a song, if no song is found, instantiates and saves a new song instance.
   self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename) #Initializes a song based on the passed-in filename.
    artist, song, genre = filename.chomp(".mp3").split(" - ")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    new(song, artist, genre)
  end

  def self.create_from_filename(filename) #Initializes and saves a song based on the passed-in filename.
    self.new_from_filename(filename).save
  end
end
