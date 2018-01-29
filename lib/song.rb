require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  extend Concerns::Findable

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    songname = filename.split(" - ")[1]
    artistname = filename.split(" - ")[0]
    genretype = filename.split(" - ")[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artistname)
    genre = Genre.find_or_create_by_name(genretype)

    self.new(songname, artist, genre)

  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

end
