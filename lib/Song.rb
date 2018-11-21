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

def genre=(genre)
  @genre = genre
  genre.songs << self if !genre.songs.include?(self)
end

def self.find_by_name(name)
    if Song.all.find{|song| song.name == name}
      Song.all.find{|song| song.name == name}
    end
  end

def self.find_or_create_by_name(name)
  if self.find_by_name(name)
    self.find_by_name(name)
  else
    Song.create(name)
  end
end


def genre=(genre)
  @genre = genre
  genre.add_song(self)
end

def save
@@all << self
end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def self.all
@@all
end

def self.destroy_all
  @@all = []
end

def self.create(name)
  x = Song.new(name)
  @@all << x 
  x
end

def self.new_from_filename(filename)
  x = filename.split(" - ")
  x[2] = x[2].chomp(".mp3")
  a = Artist.find_or_create_by_name(x[0])
  b = Genre.find_or_create_by_name(x[2])
  y = Song.new(x[1], a, b)
end 

def self.create_from_filename(filename)
  x = new_from_filename(filename)
  x.save 
  x 
end   
  
end 

