require 'pry'

class Song
  extend Concerns::Findable
  extend Concerns::Save::ClassMethods
  include Concerns::Save::InstanceMethods
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist= artist unless !artist
    self.genre= genre unless !genre
  end

  def artist=(artist)
      @artist = artist unless !!@artist
      artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    arr = filename.split(" - ")
    artist_tmp = Artist.find_or_create_by_name(arr[0])
    song = find_or_create_by_name(arr[1])
    genre_name = arr[2]
    genre_name.slice!(-4,4)
    genre_tmp = Genre.find_or_create_by_name(genre_name)
    song.artist = artist_tmp
    song.genre = genre_tmp
    song
  end

  def self.create_from_filename(filename)
      arr = filename.split(" - ")

      artist_tmp = Artist.find_or_create_by_name(arr[0])

      song = find_or_create_by_name(arr[1])

      genre_name = arr[2]
      genre_name.slice!(-4,4)
      genre_tmp = Genre.find_or_create_by_name(genre_name)

      song.artist = artist_tmp
      song.genre = genre_tmp
      song
  end
end
