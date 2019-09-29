require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      artist.add_song(self)
      @artist = artist
    end
    if genre != nil
      @genre = genre
      self.genre=(genre)
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    @@all << song
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

 def genre=(genre)
    @genre = genre
    if genre.songs.include?(self)
      genre.songs
    else
      genre.songs << self
    end
  end

  extend Concerns::Findable

  def self.new_from_filename(file)

    song_data = file.split(" - ")
    song_name = song_data[1]
    new_artist_name = song_data[0]
    song_data[2].slice! ".mp3"
    genre_name = song_data[2]

    new_song = Song.find_or_create_by_name(song_name)
    new_artist = Artist.find_or_create_by_name(new_artist_name)
    new_genre = Genre.find_or_create_by_name(genre_name)
    new_song.artist = new_artist
    new_song.genre = new_genre

    new_song
    end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
  end
end
