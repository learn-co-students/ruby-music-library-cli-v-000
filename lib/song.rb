require_relative "../config/environment.rb"

class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
     @name = name
     @artist = artist
     @genre = genre
     artist.add_song(self) if artist
     genre.add_song(self) if genre
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.songs << self
    end
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

  def self.new_from_filename(filename)
    parsed_filename = filename.split(" - ")
    artist = Artist.find_or_create_by_name(parsed_filename[0])
    genre = Genre.find_or_create_by_name(parsed_filename[2][0..-5])
    song = Song.new(parsed_filename[1], artist, genre)
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

end