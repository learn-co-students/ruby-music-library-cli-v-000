require_all 'concerns'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Concerns::Findable
  include Concerns::Savable
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @genre = genre
    @artist = artist
    artist.add_song(self) unless artist == nil
    genre.add_song(self) unless genre == nil
  end

  def self.new_from_filename(file_name)
    file_parts = file_name.split(" - ")
    song = self.new(file_parts[1])
    song.artist_name = file_parts[0]
    song.genre_name = file_parts[2].split(".").first
    song
  end

  def self.create_from_filename(file_name)
    song = new_from_filename(file_name)
    song.save
    song
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by_name(name)
    self.genre = genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all 
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
end
