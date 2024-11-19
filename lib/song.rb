require 'pry'

class Song 
attr_accessor :name
attr_reader :artist, :genre
@@all = []

def initialize(name, artist = nil, genre = nil)
  @name = name 
  if artist != nil 
    self.artist=(artist)
  end
  if genre != nil 
    self.genre=(genre)
  end
end

def artist=(song_artist)
  song_artist.add_song(self)
  @artist = song_artist
end 

def genre=(song_genre)
  song_genre.add_song(self)
  @genre = song_genre
end 

def save 
  @@all << self 
end 

def self.all 
  @@all 
end

def self.destroy_all 
  @@all.clear
end 

def self.create(name)
  song = Song.new(name)
  song.save
  song
end

def self.find_by_name(name)
 song_by_name = nil
 @@all.each do |song|
   if song.name == name 
     song_by_name = song 
   end 
 end 
 song_by_name
end

def self.find_or_create_by_name(name)
  if self.find_by_name(name)
    self.find_by_name(name)
  else 
    self.create(name)
  end 
end

  def self.new_from_filename(file)
    file_name = file.split(".")[0]
    song = self.new(file_name.split(" - ")[1]) 
    song.artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    song.genre = Genre.find_or_create_by_name(file_name.split(" - ")[2])
    song
  end 

def self.create_from_filename(filename)
new_song = self.new_from_filename(filename)
new_song.save
end

end 