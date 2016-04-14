require 'pry'
class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name,artist=nil,genre=nil)
    @name = name
    @artist = artist
    if self.artist
      self.artist = artist
    end
    @genre = genre
    if self.genre
      self.genre = genre
    end
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
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(filename)
    filename.slice!(-4..-1)
    song_attributes = filename.split(" - ")
    artist = Artist.new(song_attributes[0])
    genre = Genre.new(song_attributes[2])
    song = Song.new(song_attributes[1],artist,genre)
    song
  end

  def self.create_from_filename(filename)
    filename.slice!(-4..-1)
    song_attributes = filename.split(" - ")
    song = self.create(song_attributes[1])
    if Artist.find_by_name(song_attributes[0])
      nil
    else 
      song.artist = Artist.new(song_attributes[0])
      song.artist.save
    end
    if Genre.find_by_name(song_attributes[2])
      nil
    else
      song.genre = Genre.new(song_attributes[2])
      song.genre.save
    end
    song
  end

end