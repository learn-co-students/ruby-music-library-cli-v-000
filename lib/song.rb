class Song
  attr_accessor :name, :genre
  attr_reader :artist
  
@@all = []
  
def initialize(name, artist = nil, genre = nil)
  @name = name
  self.artist = artist if artist
  self.genre = genre if genre
end 

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  genre.songs.push self unless genre.songs.include? self
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
  @@all.detect { |song| song.name == name}
end

def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create(name)
end

def self.new_from_filename(filename)
    artist, song, genre_name = filename.split(' - ')
    split_name = genre_name.gsub('.mp3', '')
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(split_name)
    new(song, artist, genre)
end 

def self.create_from_filename(name)
  new_from_filename(name).save
end 
  



end