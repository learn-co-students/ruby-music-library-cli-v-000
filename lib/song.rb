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

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    new_song = new(name)
    new_song.save
    new_song
  end

  def save
    @@all << self
  end

  def self.new_from_filename(file_name)
    cleaned = file_name.split(".mp3")[0]
    parsed = cleaned.split(" - ")
    artist_name = parsed[0]
    song_name = parsed[1]
    genre_name = parsed[2]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new(song_name,artist,genre)
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name).save
  end

end
