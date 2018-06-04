require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :genre, :artist
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist=(artist)
    end
    if genre
      self.genre=(genre)
    end
  end

  def artist=(artist)
    # do I need an option to create a new artist if one doesn't already exist?
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    # do I need to account for creating a new genre if one doesn't already exist?
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
    genre
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

#  def self.create(name)
#    song = Song.new(name)
#    song.save
#    song
#  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    song_name = array[1]
    artist_name = array[0]
    artist = Artist.find_or_create_by_name(artist_name)
    genre_name = (array[2].chomp(".mp3"))
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

end
