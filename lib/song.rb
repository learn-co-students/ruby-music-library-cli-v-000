require 'pry'

class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(song_name, artist = nil, genre = nil)
    @name = song_name
    if artist != nil
      self.artist = artist
    end

    if genre != nil
      self.genre = genre
    end
  end

  def self.new_from_filename(filename)
    songs = filename.split(" - ")
    song_name = songs[1]
    song_artist = songs[0]
    song_genre = songs[2].split(".")[0]
    artist = Artist.find_or_create_by_name(song_artist)
    genre = Genre.find_or_create_by_name(song_genre)
    new_song = Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    @@all.detect do |song|
      if song.name == name
        song
      end
    end
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def genre=(genre)
    @genre = genre
    hello = genre.songs.detect do |song|
      song.name == @name
    end

    if hello == nil
      genre.songs << self
    end
  end

  def artist=(artist)
    artist.add_song(self)
    @artist = artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name, artist = nil, genre = nil)
    new_song = Song.new(name, artist, genre)
    new_song.save
    return new_song
  end

end
