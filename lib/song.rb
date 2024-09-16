require 'pry'
class Song
  @@all = []
  attr_accessor :name
  attr_reader :artist, :genre
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self) if artist != nil 
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self) if genre != nil
  end
  
  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1]
    song = self.find_or_create_by_name(song_name)
    artist_name = filename.split(" - ")[0]
		song.artist = Artist.find_or_create_by_name(artist_name)
		genre_name = filename.split(" - ")[2].gsub(".mp3", "")
		song.genre = Genre.find_or_create_by_name(genre_name)
		song
  end
  
  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    new_song.save
  end
  
end