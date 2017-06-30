require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name, artist=nil, genre=nil)
    instance = self.new(name, artist, genre)
    instance.save
    instance
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    artist_name = file[0]
    song_name = file[1]
    genre_name = file[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new_song = self.new(song_name, artist, genre)
    new_song

    #"Thundercat - For Love I Come - dance.mp3"
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
  end

end
