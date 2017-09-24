require 'pry'

class Song
 extend Concerns::Findable 
attr_accessor :name, :artist, :genre

@@all=[]

def initialize(name, artist=nil, genre=nil)
  @name=name
  if artist!=nil
    self.artist=artist
  end
  if genre!=nil
    self.genre=genre
  end
 self
end

def save

  @@all<<self
end

def self.all
  @@all
end

def artist=(name)
  @artist=name
  @artist.add_song(self)
end
def genre=(name)
  @genre=name
  @genre.add_song(self)
end

def self.create_from_filename(file)
    test=File.basename(file,".mp3")
 filename_holder= test.split(" - ")
 artist = Artist.find_or_create_by_name(filename_holder[0])
 genre = Genre.find_or_create_by_name(filename_holder[2])
 song = self.create(filename_holder[1], artist, genre)
end

def self.new_from_filename(filename)
  test=File.basename(filename,".mp3")
 filename_holder= test.split(" - ")
  artist = Artist.find_or_create_by_name(filename_holder[0])
 genre = Genre.find_or_create_by_name(filename_holder[2])
 song= self.new(filename_holder[1], artist, genre)
end

def self.destroy_all
  self.all.clear
end

def self.create(name, artist=nil, genre=nil)
  song = self.new(name, artist, genre)
song.save
song
end


end