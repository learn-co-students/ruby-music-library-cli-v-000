require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []


  def initialize (name, artist = nil, genre = nil)
    @name = name
    self.artist= artist if artist
    self.genre= genre if genre
  end


  def genre= (genre)
    @genre = genre
    unless genre.songs.include? (self)
    genre.songs << self
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end


  def self.create (name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create(name)
  end

  def self.new_from_filename(filename)
    new_file = filename.split(" - ")
    artist_name = new_file[0]
    name = new_file[1]
    genre_name = new_file[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    find_by_name(name) ? find_by_name(name) : self.new(name, artist, genre)
  end

  def self.create_from_filename (filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

end
