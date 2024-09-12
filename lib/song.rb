require 'pry'
class Song
attr_accessor :name, :artist, :genre
@@all = []
extend Concerns::Findable

def initialize (name, artist=nil, genre = nil)
  @name = name
  self.artist = artist if artist!= nil
  self.genre = genre if genre!= nil
end

def artist= (artist)
  @artist = artist
  artist.add_song(self)
end

def genre= (genre)
  @genre = genre
  genre.songs << self if !genre.songs.include?(self)
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

def self.new_from_filename(file_name)
  file_array = file_name.split(" - ")
  song_name = file_array[1]
  artist = Artist.find_or_create_by_name(file_array[0])
  genre = Genre.find_or_create_by_name(file_array[2].gsub('.mp3',''))
  self.new(song_name, artist, genre)

end

def self.create_from_filename(file_name)
  song = Song.new_from_filename(file_name)
  song.save
  song
end

end
