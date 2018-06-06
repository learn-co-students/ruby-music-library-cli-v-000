require 'pry'

class Song
  extend Concerns::Findable

attr_accessor :name

attr_reader :artist, :genre

@@all = []

def initialize(name, artist = nil, genre = nil)
@name = name
self.genre = genre if genre
self.artist = artist if artist != nil
end

def self.all
  @@all
end

def self.destroy_all
  all.clear
end

def save
  self.class.all << self
end

def self.create(name)
song = Song.new(name)
song.save
song
end

def artist=(artist)
  @artist=(artist)
  artist.add_song(self)
end

def genre=(genre)
  @genre=(genre)
  if !genre.songs.include?(self)
  genre.songs << self
end
end

def self.find_by_name(name)
  all.detect{|song| song.name == name}
end

def self.find_or_create_by_name(name)
  if find_by_name(name)
    find_by_name(name)
  else
    self.create(name)
  end
end

def self.new_from_filename(filename)
  Song.new(filename.split(" - ")[0], filename.split(" - ")[1], filename.split(" - ")[2])
end

end
