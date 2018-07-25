require 'pry'

class Song


attr_accessor :name, :artist, :genre

@@all =[]

def initialize(name, artist=nil, genre=nil)
@name = name
  @artist = artist
   self.artist = artist if artist != nil
   @genre = genre
   self.genre = genre if genre != nil
end

def save
  @@all << self
end


def self.all
  @@all
end

def artist=(artist)
  @artist = artist
  self.artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  self.genre.songs << self unless genre.songs.include?(self)
end


def self.destroy_all
  @@all.clear
end

def self.create(name)
  song = self.new(name)
  song.save
  song
end

def genre
  @genre
end

def self.find_by_name(name)
   self.all.detect {|song| song.name == name}
 end

 def self.find_or_create_by_name(name)
self.find_by_name(name) || self.create(name)
 end


end
