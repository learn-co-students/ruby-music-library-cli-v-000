require 'pry'

class Song
  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

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

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    unless genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create_by_name(name)
    else
      find_by_name(name)
    end
  end

  def self.create_by_name(name)
    song = self.new(name)
    @songs = []
    @@all << song
    song
  end

  def self.new_from_filename(filename)
    filename.chomp!('.mp3')
    data = filename.split(' - ')
    artist_name = data[0]
    artist = Artist.find_or_create_by_name(artist_name)
    name = data[1]
    genre_name = data[2]
    genre = Genre.find_or_create_by_name(genre_name)
    song = self.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    filename.chomp!('.mp3')
    data = filename.split(' - ')
    name = data[1]
    song = self.find_or_create_by_name(name)
    artist_name = data[0]
    artist = Artist.find_or_create_by_name(artist_name)
    song.artist = artist
    genre_name = data[2]
    genre = Genre.find_or_create_by_name(genre_name)
    song.genre = genre
    song
  end
end
