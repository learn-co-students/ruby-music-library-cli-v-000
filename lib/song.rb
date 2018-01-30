require_relative '../config/environment.rb'

class Song
  extend Concerns::Findable

  attr_accessor :name, :genre, :artist
 

  @@all = []

  def initialize(name, artist ="", genre ="")
    @name = name
    self.artist = artist unless artist == ""
    self.genre = genre unless genre == ""
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
    song = Song.new(name)
    song.save
    song
  end

  def self.new_from_filename(file_name)
    file_name = file_name.chomp(".mp3").split(" - ")
    artist_name = file_name[0]
    name = file_name[1]
    genre = file_name[2]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre)
    song = Song.new(name, artist, genre)
    song
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name).save.first
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end
end