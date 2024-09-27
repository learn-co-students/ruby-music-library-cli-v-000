require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.find_by_name(name)
    @@all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) != nil
      find_by_name(name)
    else
      s = Song.create(name)
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
    s = Song.new(name)
    s.save
    s
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by_name(name)
    genre.add_song(self)
  end

  def self.new_from_filename(file_name)
    file_song = file_name.split(" - ")
    artist_name = file_song[0]
    song_name = file_song[1]
    genre_name = file_song[2].chomp(".mp3")
    song = Song.new(song_name)
    song.artist_name = artist_name
    song.genre_name = genre_name
    song
  end

  def self.create_from_filename(file_name)
    song = new_from_filename(file_name)
    song.save
    song
  end


end
