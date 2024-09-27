require_relative '../config/environment'

class Song

  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist= artist
    end
    if genre
      self.genre= genre
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all <<  self
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre= genre
    genre.songs= self
  end

  def self.new_from_filename(song_file)
    artist_name =song_file.split(" - ")[0]
    song_name = song_file.split(" - ")[1]
    genre_name = song_file.split(" - ")[2].gsub(".mp3","")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new_song = Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(song_file)
    new_song = new_from_filename(song_file)
    new_song.save
    new_song
  end



end
