require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Findable
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(name)
    @artist = name
    artist.add_song(self)
  end

  def genre=(name)
    @genre = name
    #binding.pry
    genre.add_song(self)
  end


  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def self.new_from_filename(filename)
    artist_name, song_name, genre = filename.split(" - ")
    @name = song_name
    @artist = Artist.find_or_create_by_name(artist_name)
    @genre = Genre.find_or_create_by_name(genre.split(".")[0])
    song = self.new(@name, @artist, @genre)
  end

  def self.create_from_filename(filename)
    binding.pry
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
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

end