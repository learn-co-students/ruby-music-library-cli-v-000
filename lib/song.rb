class Song

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :genre, :artist


  @@all = []

  def initialize(name, artist = nil, genre = nil) # optional argument
    @name = name
    self.artist = artist if artist    # for when they do or dont exist
    self.genre = genre if genre
  end

  def self.all  # all classes in class
    @@all
  end

  def self.destroy_all   # songs in instance
    @@all.clear
  end

  def add_song
    Artist.songs << self  # adding song to Artists songs
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)  # alternative intitlizer
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)  # checking to see if it's already in songs
  end

  def self.find_by_name(name)
    @@all.detect{ |s| s.name == name }
  end

  def save
      self.class.all << self
  end

  def self.create(name)
    song = new(name)
    song.save
    song
  end

  def self.find_or_create_by_name(name)
        find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    new_song = parts[1]
    artist = parts[0]
    genre = parts[2].gsub(".mp3","")

    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)

    new(new_song, artist, genre)
  end

  def self.create_from_filename(filename)
      @@all << new_from_filename(filename)
  end





end
