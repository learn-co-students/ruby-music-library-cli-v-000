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
