require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      @artist = artist
      artist.songs << self
    end
    if genre
      @genre = genre
      genre.songs << self
    end
  end

  def self.create(name, artist = nil, genre = nil)
    new_instance = self.new(name, artist = nil, genre = nil)
    new_instance.save
    new_instance
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def artist=(artist_name)
    @artist = artist_name
    @artist.add_song(self)
  end

  def genre= (genre)
    @genre = genre
    @genre.songs << self unless genre.songs.detect{|song| song == self}
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    song_parts = filename.split(" - ")
    song_name = song_parts[1]
    song_artist = song_parts[0]
    song_genre = song_parts[2].chomp(".mp3")
    song_artist = Artist.find_or_create_by_name(song_artist)
    song_genre = Genre.find_or_create_by_name(song_genre)
    new_song = self.new(song_name, song_artist, song_genre)
    new_song
  end

  def self.create_from_filename(filename)
    song_parts = filename.split(" - ")
    song_name = song_parts[1]
    song_artist = song_parts[0]
    song_genre = song_parts[2].chomp(".mp3")
    song_artist = Artist.find_or_create_by_name(song_artist)
    song_genre = Genre.find_or_create_by_name(song_genre)
    new_song = self.create(song_name, song_artist)
    new_song.artist = song_artist
    new_song.genre = song_genre
    new_song
  end

end
