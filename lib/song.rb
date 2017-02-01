require 'pry'
class Song

attr_accessor :name, :genre
attr_reader :artist
@@all = []


def initialize(name, artist = nil, genre = nil)
  @name = name
  self.artist=(artist) if artist
  self.genre=(genre) if genre  
  save
end# of initialize


def artist=(artist)
  @artist = artist
  artist.add_song(self)
end# of artist=


def genre=(genre)
  @genre = genre 
  genre.songs << self unless genre.songs.include?(self)
end# of genre 


def self.all
  @@all
end# of self.all


def self.destroy_all
  self.all.clear 
end# of self.destroy_all


def save
  self.class.all << self
end# of save 


def self.create(name)
  song = self.new(name)
  song.save 
  song 
end# of self.create


def self.find_by_name(name)
  self.all.find {|song| song.name == name}
end# of self.find_by_name


def self.find_or_create_by_name(name)
  if self.find_by_name(name) == nil
      self.create(name)
  else 
    self.find_by_name(name) 
  end# of if 
end# of self.find_or_create_by_name


def self.new_from_filename(file_name)
    data = file_name.split("-")
    artist_name = data[0].strip
    song_name = data[1].strip
    song_genre = data[2].strip.split(".mp3").join("")
    song = self.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(song_genre)
    song 
end# of self.new_by_filename


def self.create_from_filename(file_name)
    data = file_name.split("-")
    artist_name = data[0].strip
    song_name = data[1].strip
    song_genre = data[2].strip.split(".mp3").join("")
    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(song_genre)
    song 
end# of self.create_from_filename


end# of Song