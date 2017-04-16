require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    if artist != nil
      artist.add_song(self)
    end
    if genre != nil
      genre.add_song(self)
    end
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(new_song)
    song = self.new(new_song)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(song_lookup)
    all.detect {|song| song.name == song_lookup}
  end

  def self.find_or_create_by_name(song_lookup)
    if song = all.detect {|song| song.name == song_lookup}
      song
    else
      song = self.new(song_lookup)
      song
    end
  end

  def self.new_from_filename(file)
    new_str = file.sub(/.mp3/, '') # remove .mp3
    artist_name = new_str.split(" - ")[0] # extract artist name
    song_name = new_str.split(" - ")[1] # extract song title
    genre_name = new_str.split(" - ")[2] # extract song genre
    song = self.new(song_name) # create a new song instance
    song.artist = Artist.create(artist_name) # create a new artist instance
    song.genre = Genre.create(genre_name) # create a new genre instance
    song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end

end
