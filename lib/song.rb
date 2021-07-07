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

def self.all
  @@all
end

def save
  @@all << self
end

def self.create(name)
  song = self.new(name)
song.name = name
song.save
song
end

def self.destroy_all
  @@all.clear
end

def self.find_by_name(name)
  self.all.detect{|song| song.name == name}
end


def self.find_or_create_by_name(name)
  if self.find_by_name(name)
    self.find_by_name(name)
  else
    self.create(name)
      end
    end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def genre=(genre)
 @genre = genre
 song = self
 if !genre.songs.include?(song)
genre.songs << self
end
end

def self.new_from_filename(filename)
  formatted_song = filename.split(' - ')
  artist = Artist.find_or_create_by_name(formatted_song[0])
  genre = Genre.find_or_create_by_name(formatted_song[2].split('.mp3')[0])
  new_song = self.new(formatted_song[1], artist, genre)
  new_song
end

def self.create_from_filename(filename)
  new_song = self.new_from_filename(filename)
  new_song.save

end

end
