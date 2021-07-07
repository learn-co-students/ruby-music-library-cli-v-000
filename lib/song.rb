require "pry"

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def genre
    @genre
  end

  def genre=(genre_object)
    @genre = genre_object
    @genre.songs << self unless @genre.songs.include?(self)
  end


  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def artist_name=(artist)
    a = Artist.find_or_create_by_name(artist)
    a.add_song(self)
  end

  def genre_name=(genre)
    a = Genre.find_or_create_by_name(genre)
    self.genre = a
  end

  def save
    @@all << self
  end


  def self.destroy_all
    @@all.clear
    @@all
  end

  def self.create(new_name)
  new_song = self.new(new_name)

  @@all << new_song
  new_song
  end

  def self.all
    @@all
  end

  def self.find_by_name(song_name)
    self.all.detect do |x|
      x.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create(song_name)
  end

  def self.new_from_filename(song_file)
    array = song_file.split(" - ")
  new_song = self.new(array[1])
  new_song.artist_name = array[0]
  new_song.genre_name = array[2].gsub(".mp3", "")
    new_song
  end

  def self.create_from_filename(song_file)
    a = self.new_from_filename(song_file)
   a.save
  end


end
