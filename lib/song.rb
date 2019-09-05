require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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

  def self.create(song)
    song = self.new(song)
    song.save
    song
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
    self.all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(name)
    artist_name = name.split(" - ")[0]
    song_name = name.split(" - ")[1]
    genre_name = name.split(" - ")[2].gsub(".mp3","")
    new_song = Song.new(song_name)
    new_song.artist = Artist.find_or_create_by_name(artist_name)
    new_song.artist.add_song(new_song)
    new_song_genre = Genre.find_or_create_by_name(genre_name)
    new_song.genre = new_song_genre
    new_song
  end

  def self.create_from_filename(name)
    @@all << self.new_from_filename(name)
  end

  def self.sorted_songs
    self.all.sort{ |x,y| x.name <=> y.name }
  end
end
