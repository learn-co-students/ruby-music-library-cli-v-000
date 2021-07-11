require 'pry'
class Song
  attr_reader :artist
  attr_accessor :name, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  # FINDABLE

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name)
      return song
    else
      return self.create(name)
    end
  end

  # MEMORABLE

  def self.create(name, artist = nil, genre = nil)
    song = self.new(name, artist, genre)
    song.save
    return song
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(filename)
    artist_name, song_title, genre_name =
    filename.match(/(.+)\s-\s(.+)\s-\s(.+).mp3/).captures

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(song_title, artist, genre)
    return song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end

end
