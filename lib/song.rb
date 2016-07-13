require 'pry'
class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  #.new calls initialize, accepts optional artist/genre, then sets self.artist and self.genre
  def initialize(name, artist = nil, genre = nil)
    @name= name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
  end

  #makes sure self.genre is an instance of Genre, also adds self to Artist class' song instances
  def artist=(artist)
    raise AssociationTypeMismatchError, "#{artist.class} received, Artist expected." if !artist.is_a?(Artist)
    @artist= artist
    if artist.songs.include?(self) == false
      artist.add_song(self)
    end
  end

  #makes sure self.genre is of type Genre, also adds self to Genre class' song instances
  def genre=(genre)
    raise AssociationTypeMismatchError, "#{genre.class} received, Genre expected." if !genre.is_a?(Genre)
    @genre= genre
    if genre.songs.include?(self) == false
      genre.add_song(self)
    end
  end

  #retuns matching instance of song if Song.all contains an instance with song.name= to name
  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  #returns instance of song, creates using custom constructor if neccessary
  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      song = self.create(name)
    else
      self.find_by_name(name)
    end
  end

  #returns array containing all saved instances of Song class
  def self.all
    @@all
  end

  #empties @@all array
  def self.destroy_all
    self.all.clear
  end

  #purposely the only way to add an instance of Song to @@all
  def save
    self.class.all << self
  end

  #custom class constructor that instantiates and saves that instance of Song to @@all with name
  def self.create(name, artist = nil, genre = nil)
    song = Song.new(name, artist, genre)
    song.save
    return song
  end

  #custom constructor that creates an instance of Song from a filename
  def self.new_from_filename(filename)
    #returns ["artist", "song", "genre.mp3"]
    split_filename = filename.split(" - ")
    #sets song_name to "song"
    song_name = split_filename[1]
    #holds "artist", creates new instance of Artist if neccessary
    artist_name = split_filename[0]
    artist = Artist.find_or_create_by_name(artist_name)
    #holds "genre", creates new instance of Genre if neccessary
    genre_name = split_filename[2].slice(/(\w*).mp3/, 1)
    genre = Genre.find_or_create_by_name(genre_name)

    song = self.new(song_name, artist, genre)

    return song
  end

  def self.create_from_filename(filename)
    #returns ["artist", "song", "genre.mp3"]
    split_filename = filename.split(" - ")
    #sets song_name to "song"
    song_name = split_filename[1]
    #holds "artist", creates new instance of Artist if neccessary
    artist_name = split_filename[0]
    artist = Artist.find_or_create_by_name(artist_name)
    #holds "genre", creates new instance of Genre if neccessary
    genre_name = split_filename[2].slice(/(\w*).mp3/, 1)
    genre = Genre.find_or_create_by_name(genre_name)

    song = self.create(song_name, artist, genre)
    return song
  end

end
