require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist
    @artist
  end

  def artist=(artist)
    if artist != nil
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre
    @genre
  end

  def genre=(genre)
    if genre != nil
      @genre = genre
      genre.add_genre(self)
    end
  end

  def self.new_from_filename(file)
    song_name = file.split(" - ")[1]
    song_artist = file.split(" - ")[0]
    song_genre = file.split(" - ")[2].chomp(".mp3")
    artist = Artist.find_or_create_by_name(song_artist)
    genre = Genre.find_or_create_by_name(song_genre)
    song = self.new(song_name, artist, genre)
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end

end
