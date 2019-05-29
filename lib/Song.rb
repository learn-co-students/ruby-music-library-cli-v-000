require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  extend Concerns::Findable

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def save
    self.class.all << self
    # binding.pry
  end

  def artist=(artist)
    artist.add_song(self)
    @artist = artist
  end

  def genre=(genre)
    genre.add_song(self)
    @genre = genre
  end

  def self.new_from_filename(filename)
    song_string = filename.split(" - ")[1]
    artist_string = filename.split(" - ")[0]
    artist = Artist.find_or_create_by_name(artist_string)
    genre_string = filename.split(" - ")[2].gsub(".mp3","")
    genre = Genre.find_or_create_by_name(genre_string)

    if self.find_by_name(song_string)
      self.find_by_name(song_string)
    else
      self.new(song_string,artist, genre)
    end
    # song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

end
