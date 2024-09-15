require 'pry'
class Song

  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name, artist= nil, genre = nil)
    new_song = self.new(name, artist= nil, genre = nil)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.detect {|n| name == n.name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else self.create(name)
    end
  end

  def self.new_from_filename(file_name)
    artist_name, song_name, genre_name = file_name.split(" - ")
    genre_name.slice!(".mp3")
    @genre = Genre.find_or_create_by_name(genre_name)
    @name = song_name
    @artist = Artist.find_or_create_by_name(artist_name)
    song = self.new(@name, @artist, @genre)
    song
  end

  def self.create_from_filename(file_name)
    artist_name, song_name, genre_name = file_name.split(" - ")
    genre_name.slice!(".mp3")
    @genre = Genre.find_or_create_by_name(genre_name)
    @name = song_name
    @artist = Artist.find_or_create_by_name(artist_name)
    song = self.new(@name, @artist, @genre)
    song.save
    song
  end

end
