require 'pry'

class Song

attr_accessor :name, :artist, :genre


@@all = []

def initialize(name, artist = nil, genre = nil)
  @name = name
  if artist != nil
    self.artist = artist
  end
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

end
