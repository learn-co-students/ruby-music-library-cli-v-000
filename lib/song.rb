require 'pry'
class Song
attr_accessor :name
attr_reader :artist, :genre
@@all = []

def initialize(name,artist = nil,genre = nil)
  @name = name
  self.artist = artist if artist != nil
  self.genre = genre if genre != nil
end


def self.new_from_filename(filename)
  new_file = filename.split(" - ")
  artist = new_file[0]
  song = new_file[1]
  genre = new_file[2].gsub(".mp3","")

  new_artist = Artist.find_or_create_by_name(artist)
  new_genre = Genre.find_or_create_by_name(genre)

  song = self.new(song,new_artist,new_genre)
end

def self.create_from_filename(filename)
  new_name = new_from_filename(filename)
  new_name.save
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
  song = self.new(name)
  song.save
  song       #was already saved.
end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  genre.add_song(self)
end

def self.find_by_name(name)
    all.detect do |song|
      song.name == name
  end
end

def self.find_or_create_by_name(name)
  find_by_name(name) || create(name)
end


end
