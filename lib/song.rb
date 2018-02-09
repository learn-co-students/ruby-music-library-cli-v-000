#require_relative "./concerns/findable.rb"
#when you use pry, use it in the environment where the error is coming up.
#tests were passing so don't run tests with pry
#run pry through the development environment (where error is occuring)
require 'pry'
class Song

  attr_accessor :name
  attr_reader :genre, :artist
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

  def self.create(song_name)
    song = Song.new(song_name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_songs(self) if !genre.songs.include?(self)
  end
=begin
  def self.find_by_name(name)
    @@all.find {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create(name)
    end
  end
=end

  def self.new_from_filename(file)
=begin
    binding.pry
    parts = []
    parts << file.split(" - ")
    song = parts[1]
    artist_string = parts[0]
    genre_string = parts[2].gsub(".mp3", "")
    #condensed could be written
=end

    parts = []
    parts = file.split(" - ")
    #binding.pry
    artist_string, song, genre_string = parts[0], parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_string)
    genre = Genre.find_or_create_by_name(genre_string)

    new(song, artist, genre)
    #binding.pry

  end

  def self.create_from_filename(file)
    #new_from_filename(file).save
    new_from_filename(file).tap{ |s| s.save }
  end

  def self.find_by_name(name)
    all.detect{ |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
end
