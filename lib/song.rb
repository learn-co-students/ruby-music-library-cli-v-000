require "pry"
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  @@all = []

  def artist=(artist)
      @artist = artist
      @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(file)
    new_file = file.split(" - ")
    song_name = new_file[1]
    artist_name = new_file[0]
    genre_name = new_file[2].gsub(".mp3", "")
    new_song = self.new(song_name)
    new_song.artist = Artist.find_or_create_by_name(artist_name)
    new_song.genre = Genre.find_or_create_by_name(genre_name)
    new_song
  end

  def self.create_from_filename(file)
    new_file = file.split(" - ")
    song_name = new_file[1]
    artist_name = new_file[0]
    genre_name = new_file[2].gsub(".mp3", "")
    new_song = self.create(song_name)
    new_song.artist = Artist.find_or_create_by_name(artist_name)
    new_song.genre = Genre.find_or_create_by_name(genre_name)
    new_song

  end

end
