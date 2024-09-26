require 'pry'
class Song
  attr_accessor :name, :genre 
  attr_reader :artist
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
 
 def genre=(genre)
  @genre = genre
  genre.add_song(self)
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

def self.create(name, artist = nil, genre = nil)
  song = Song.new(name, artist, genre)
  song.save
  song
end

def self.find_by_name(name)
  @@all.detect {|song| song.name == name}
end

def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create(name)
end

def self.new_from_filename(filename)
  artist_name = filename.split(" - ")[0]
  song_name = filename.split(" - ")[1]
  genre_name = filename.split(" - ")[2].gsub(".mp3", "")
 
  artist = Artist.find_or_create_by_name(artist_name)
  genre = Genre.find_or_create_by_name(genre_name)
   Song.new(song_name, artist, genre)

end
 
 def self.create_from_filename(filename)
     artist_name = filename.split(" - ")[0]
  song_name = filename.split(" - ")[1]
  genre_name = filename.split(" - ")[2].gsub(".mp3", "")
 
  artist = Artist.find_or_create_by_name(artist_name)
  genre = Genre.find_or_create_by_name(genre_name)
  song = Song.new(song_name, artist, genre)
  song.save[0]
 
end
end