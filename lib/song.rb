require 'pry'

class Song

attr_accessor :name, :artist, :genre


@@all = []

def initialize(name, artist = nil, genre = nil)
  @name = name
  @artist = artist
  if artist != nil
    self.artist = artist
  end
  @genre = genre
  if genre != nil
    self.genre = genre
  end
end

def genre=(genre)
  @genre = genre
  if !genre.songs.include?(self)
    genre.songs << self
  else
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

def self.find_by_name(song)
  @@all.detect do |x|
    x.name == song
  end
end

def self.find_or_create_by_name(song)
  if !self.find_by_name(song)
    self.create(song)
  else
    self.find_by_name(song)
  end
end

def self.new_from_filename(name)
  filename = name.split(' - ')
  song_artist = filename[0]
  song_name = filename[1]
  song_genre = filename[2].chomp(".mp3")
  song_object = Artist.find_or_create_by_name(song_artist)
  genre_object = Genre.find_or_create_by_name(song_genre)
  self.new(song_name,song_object,genre_object)
end

def self.create_from_filename(name)
end

end
