require_relative "../config/environment.rb"
require_relative "../concerns/findable.rb"

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist=(artist)
    end
    if genre
      self.genre=(genre)
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    if !artist.songs.include?(self)
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre

    if !genre.songs.include?(self)
      genre.add_song(self)
    end
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    filename_pieces = filename.split(" - ")
    artist_name = filename_pieces[0]
    song_name = filename_pieces[1]
    genre_name = filename_pieces[2].split(".")[0]

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

end
