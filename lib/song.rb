require "pry"
class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @songs = []
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
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

  def self.create(song_name)
    song = self.new(song_name)
    @@all << song
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.find_by_name(name)
    self.all.detect {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    parsed_name = filename.split(" - ")
    artist_name = parsed_name[0]
    song_name = parsed_name[1]
    genre_name = parsed_name[2].chomp(".mp3")
    art = Artist.find_or_create_by_name(artist_name)
    gen = Genre.find_or_create_by_name(genre_name)
    Song.new(song_name, art, gen)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
  end
end
