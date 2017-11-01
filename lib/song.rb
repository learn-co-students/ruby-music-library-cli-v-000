require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(new_song, artist="", genre="")
    @name = new_song
    self.artist=(artist) unless artist == ""
    self.genre=(genre) unless genre == ""
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

  def self.create(song)
    created_song = self.new(song)
    created_song.save
    created_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(filename)

      data = filename.split(" - ")
      artist = data[0]
      song_name = data[1]
      genre = data[2].gsub(".mp3", "")

      new_artist = Artist.find_or_create_by_name(artist)
      new_genre = Genre.find_or_create_by_name(genre)
      new(song_name, new_artist, new_genre)

  end

  def self.create_from_filename(filename)
    song_name = self.new_from_filename(filename)
    song_name.save
    song_name
  end

end
