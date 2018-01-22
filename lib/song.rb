require 'pry'


class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    unless artist == nil
      self.artist = artist
    end
    unless genre == nil
      self.genre = genre
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
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
    unless genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.find_by_name(name)
    self.all.detect{ |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(file)
    file_array = file.split(" - ")
    song_name = file_array[1]
    song_artist = file_array[0]
    song_genre = file_array[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(song_artist)
    genre = Genre.find_or_create_by_name(song_genre)

    Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
    .save
  end

end
