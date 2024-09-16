require 'pry'
class Song

  attr_accessor :name
  attr_reader :genre


  @@all = []

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

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name)? self.find_by_name(name) : self.create(name)

  end

  def artist=(artist_name)
    @artist = artist_name
    artist.add_song(self)
  end

  def artist
    @artist
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    filename = filename.gsub(".mp3","")
    artist_name, song_name, genre_name = filename.split(" - ")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song 
  end
end
