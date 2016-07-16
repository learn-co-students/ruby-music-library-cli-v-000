require 'pry'

class Song

attr_accessor :name, :artist, :genre

@@all = []
@all_genres = []

def initialize(name, artist=nil, genre=nil)
  @name = name
  self.artist = artist if artist != nil
  self.genre = genre if genre != nil
  @@all << self
end

def genre=(genre)
  @genre = genre
  genre.songs << self if genre.songs.include?(self) == false
end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def self.all
  @@all
end

def save
  @@all << self
  self
end

def self.destroy_all
  @@all.clear
end

def self.create(name, artist=nil,genre=nil)
  self.new(name,artist,genre).save
end

def self.find_by_name(title)
  @@all.find {|x|x.name == title}
end


def self.find_or_create_by_name(title)
  if find_by_name(title) == nil
    self.create(title)
  else
    find_by_name(title)
  end
end

def self.new_from_filename(song)
  title = song.split(' - ')[1]
  artist = Artist.find_or_create_by_name(song.split(' - ')[0])
  genre = Genre.find_or_create_by_name(song.split(' - ')[2].gsub(".mp3", ""))
  self.new(title,artist,genre)
end

def self.create_from_filename(song)
  title = song.split(' - ')[1]
  artist = Artist.find_or_create_by_name(song.split(' - ')[0])
  genre = Genre.find_or_create_by_name(song.split(' - ')[2].gsub(".mp3", ""))
  self.create(title,artist,genre)
end


end
