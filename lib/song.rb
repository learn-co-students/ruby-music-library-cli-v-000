require_relative "../concerns/findable.rb"

class Song
  extend Concerns::Findable #extends rather than includes module to treat as class methods
  attr_accessor :name #attribute accessor (getter and setter)
  attr_reader :artist, :genre
  @@all = [] #Class variable array that keeps track of all instances

  #-------INSTANCE METHODS-------
  def initialize(name, artist=nil, genre=nil) #Initialize method - invoked when instantiated
    @name = name #Instance variable - local to instances
    self.artist = artist if artist != nil #Only set if not nil because it calls the setter method below with self.artist=
    self.genre = genre if genre != nil
  end

  def save
    @@all << self #Loads instance into class array
  end

  def artist=(artist) #Setter method for @artist
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre) #Setter method for @genre
    @genre = genre
    genre.add_song(self)
  end
  
  def name_listing
    "#{@artist.name} - #{@name} - #{@genre.name}"
  end

  #-------CLASS METHODS-------
  def self.create(name)
    song = self.new(name) #Creates a new instance of self class (Song)
    song.save
    song #Implicitly returns song instance
  end

  def self.new_from_filename(filename)
    data = File.basename(filename, ".*").split(" - ") #gets rid of file extension; splits filename into an array based on dashes in between terms
    artist, song_name, genre = data[0], data[1], data[2] #multiple assignment of variables
    song = self.new(song_name) #Creates a new instance of self class (Song)
    song.artist = Artist.find_or_create_by_name(artist) #sets the song instance's artist to the Artist instance already in the Artist class's array, or creates a new Artist based on the name supplied
    song.genre = Genre.find_or_create_by_name(genre) #sets the song instance's genre to the Genre instance already in the Genre class's array, or creates a new Genre based on the name supplied
    song #Implicitly returns song instance
  end

  def self.create_from_filename(filename)
    data = File.basename(filename, ".*").split(" - ") #gets rid of file extension; splits filename into an array based on dashes in between terms
    artist, song_name, genre = data[0], data[1], data[2] #multiple assignment of variables
    song = self.create(song_name) #Creates a new instance of self class (Song) and saves it
    song.artist = Artist.find_or_create_by_name(artist) #sets the song instance's artist to the Artist instance already in the Artist class's array, or creates a new Artist based on the name supplied
    song.genre = Genre.find_or_create_by_name(genre) #sets the song instance's genre to the Genre instance already in the Genre class's array, or creates a new Genre based on the name supplied
    song #Implicitly returns song instance
  end

  def self.all
    @@all #Implicitly returns class array
  end

  def self.destroy_all
    @@all.clear #Empties class array
  end

end