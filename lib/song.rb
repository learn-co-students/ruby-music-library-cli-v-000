require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  # convention for saving - .new (unsaved) .create(saved) .find (already saved) all return objects
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end



  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.count
    @all.size
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    artist = Artist.find_or_create_by_name(artist_name)

    genre = parts[2].chomp(".mp3")
    genre = Genre.find_or_create_by_name(genre)
    name = parts[1]
    song = self.new(name, artist, genre)
    song

  end

  def self.create_from_filename(filename)
    # parts = filename.split(" - ")
    # artist_name = parts[0]
    # genre = parts[2].chomp(".mp3")
    #
    # song = self.create
    # song.name = name_of_song
    # song.artist_name = artist_name
    # song
  end




end
