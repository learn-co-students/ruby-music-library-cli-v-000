require 'pry'
class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  attr_reader :path

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
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
    s = @@all.detect {|song| song.name == name}
    return s if s != nil

    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.songs << self
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(file)
    artist = Artist.create(file.split(" - ")[0])
    genre = Genre.create(file.split(" - ")[2].gsub(".mp3",""))
    song = self.new(file.split(" - ")[1], artist, genre)
  end

  def self.create_from_filename(file)
    artist = Artist.create(file.split(" - ")[0])
    genre = Genre.create(file.split(" - ")[2].gsub(".mp3",""))
    song = self.create(file.split(" - ")[1])
    song.artist = artist
    song.genre = genre
    song
  end

end
