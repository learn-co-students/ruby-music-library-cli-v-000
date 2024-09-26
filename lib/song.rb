require 'pry'

class Song

  extend Concerns::Findable
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist= nil, genre= nil)
    @name = name
    self.artist= artist if artist
    self.genre= genre if genre
  end

  def self.all
    @@all
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
    filename_array = filename.split(" - ")
    song_name = filename_array[1]
    song_artist = filename_array[0]
    song_genre = filename_array[2].chomp(".mp3")

    artist = Artist.find_or_create_by_name(song_artist)
    genre = Genre.find_or_create_by_name(song_genre)
    song = Song.new(song_name,artist,genre)


    song

  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end


end
