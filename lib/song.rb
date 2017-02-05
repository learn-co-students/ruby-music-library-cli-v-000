require 'pry'

class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
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

  def self.create(name)
    Song.new(name).tap {|song| song.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    parsed = filename.gsub(".mp3", "").split(" - ")
    song = Song.find_or_create_by_name(parsed[1])
    genre = Genre.find_or_create_by_name(parsed[2])
    artist = Artist.find_or_create_by_name(parsed[0])
    song.artist = artist
    song.genre = genre
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song
  end

end
