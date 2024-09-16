require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  # adds the song to the artist's songs
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  # adds the song to the genre's songs
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
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
    new(name, artist, genre).tap{|s| s.save}
  end

  def self.find_by_name(name)
    @@all.find { |a| a.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename) #Thundercat - For Love I Come - dance.mp3
    filename_parts = filename.split(" - ")

    artist_name = filename_parts[0]
    song_name = filename_parts[1]
    genre_type = filename_parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_type)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    filename_parts = filename.split(" - ")

    artist_name = filename_parts[0]
    song_name = filename_parts[1]
    genre_type = filename_parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_type)
    self.create(song_name, artist, genre)
  end

end
