class Song
  # below we extracting some common functionality of the Findable module into the class
  extend Concerns::Findable # Folder::Filename:  ruby's convention of namespacing modules

  attr_accessor :name, :artist, :genre

  @@all =[]

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @@all << self
    # below we are saying if we get an artist passed in as an argument
    # then artist is set to the artist that was passed in and not nil
    if artist
      @artist = artist
      @artist.add_song(self)
    end
    # and artist.add_song(self) will successfully add the song to the artist once it is not set to nil
    if genre
      @genre = genre
      @genre.add_song(self)
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self # saves each instance of the class into the all class array. Note: This syntax self.class.all is  more reusable
  end

  # instantiates an instance using .new but also evokes #save on that instance, forcing it to persist immediately.
  def self.create(name)
    song = Song.new(name, artist=nil, genre=nil)
    song.save
    song
  end

  # adds the song to the artist\'s songs
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def find_by_name(name)
    self.all.find {|a| a.name }
  end

  def find_or_create_by_name(name)
    # self.find_by_name(name)? self.find_by_name(name) : self.create(name) refactored below
    self.find_by_name(name) || self.create(name)
  end

  # Add a new method to the Song class called .new_from_filename that creates a Song based on a filename
  def self.new_from_filename(filename)
    artist_name, song_name, genre_name = filename.split(" - ") # seperate eaach file by
    new_genre_name = genre_name.gsub(".mp3","") # remove the extra .mp3 at the end

    # the name is supposed to return as a string while
    # the artist, genre parameters are returned as objects

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(new_genre_name)

    song = self.new(song_name, artist, genre)
  end

  # Add a new method to the Song class called .create_from_filename that creates
  # a Song based on a filename and saves it to the @@all class variable
  def self.create_from_filename(filename)
    artist_name, song_name, genre_name = filename.split(" - ") # seperate eaach file by
    new_genre_name = genre_name.gsub(".mp3","") # remove the extra .mp3 at the end

    # the name is supposed to return as a string while
    # the artist, genre parameters are returned as objects

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(new_genre_name)
    song = self.new(song_name, artist, genre)
    # binding.pry
  end

end
