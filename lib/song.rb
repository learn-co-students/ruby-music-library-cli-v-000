require_relative '../concerns/concerns.rb'

class Song
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre =  genre unless genre.nil?
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    song = Song.new(data[1])
    song.artist = Artist.find_or_create_by_name(data[0])
    song.genre = Genre.find_or_create_by_name(data[2].split(".mp3").join(""))
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

end
