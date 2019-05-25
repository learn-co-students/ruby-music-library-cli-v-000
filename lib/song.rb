require 'pry'
class Song

attr_accessor :name


@@all = []


def initialize(name,artist=nil,genre=nil)
  @name = name
  self.artist=(artist)
  self.genre=(genre)
end

def artist=(artist)
  @artist = artist
  if @artist != nil
    @artist.add_song(self)
  end
end

def artist
  return @artist
end

def genre=(genre)
  @genre = genre
  if genre != nil && !genre.songs.include?(self)
    genre.songs << self
  end
end

def genre
  return @genre
end


def self.all
  @@all
end

def save
  @@all << self
end

def self.destroy_all
  @@all.clear
end

def self.create(name)
  new_song = self.new(name)
  new_song.save
  new_song
end

def self.find_by_name(name)
  @@all.each do|song|
    if song.name == name
      return song
    end
  end
  return false
end

def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
end

def self.new_from_filename(name)
  artist,song,genre_name = name.split(" - ")
  new_genre = genre_name.gsub(".mp3","")
  artist = Artist.find_or_create_by_name(artist)
  genre = Genre.find_or_create_by_name(new_genre)
  new(song,artist,genre)
end

def self.create_from_filename(name)
  new_name = self.new_from_filename(name)
  new_name.save
end



end
