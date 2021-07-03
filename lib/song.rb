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

def genre
  @genre
end

def genre=(genre)
  @genre = genre
  new_genre = genre.songs
  new_genre << self if !genre.songs.include?(self)
end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def self.new_from_filename(file_name)
  array = file_name.split(" - ")
  song_name = array[1]
  artist_name = array[0]
  genre_name = array[2].split(".mp3").join
  artist = Artist.find_or_create_by_name(artist_name)
  genre = Genre.find_or_create_by_name(genre_name)
  self.new(song_name, artist, genre)
end

def self.create_from_filename(file_name)
  self.new_from_filename(file_name).save
end


def self.find_by_name(song_name)
  @@all.find{|song| song.name == song_name}
end

def self.find_or_create_by_name(song_name)
  result = self.find_by_name(song_name)
  if result
    result
  else
    self.create(song_name)
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
  created_song = Song.new(name)
  created_song.save
  created_song
end


end
