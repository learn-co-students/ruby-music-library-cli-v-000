require 'pry'

class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
 
  def save
    @@all << self
  end
 
  def self.all
    @@all
  end

  def self.create(name, artist = nil, genre = nil)
    Song.new(name).tap {|song| song.save}
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(x)
    parts = x.split(" - ")
    artist_name = parts[0]
    song_name = parts[1] 
    genre_name = parts[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(x)
    parts = x.split(" - ")
    artist_name = parts[0]
    song_name = parts[1] 
    genre_name = parts[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(song_name, artist, genre)
    @@all << song
    song
  end
  #binding.pry

  def self.destroy_all
    @@all.clear
  end
 

end
