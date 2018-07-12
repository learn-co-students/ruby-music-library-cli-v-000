require 'pry'
class Song

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name, artist = nil, genre = nil)
    new_song = self.new(name, artist, genre)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1]

    new_song = self.new(song_name)
    
    artist_name = filename.split(" - ")[0]
    genre_name = filename.split(" - ")[2]
    new_song.artist = Artist.create(artist_name)
    new_song.genre = Genre.create(genre_name)
    new_song


  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

end
