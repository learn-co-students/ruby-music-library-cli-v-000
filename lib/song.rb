class Song
  extend Concerns::Findable
attr_accessor :name
attr_reader :artist, :genre
@@all = []

def initialize(name, artist=nil, genre=nil)
  @name=name
  @songs=[]
  self.genre=genre
self.artist=artist
end

def artist=(artist)
    @artist = artist
     if !artist.nil?
       artist.add_song(self)
     end
   end

def genre=(genre)
@genre = genre
if !genre.nil?
  genre.songs << self if not genre.songs.include?(self)
end
end

def self.all
@@all
end

def self.destroy_all
@@all = []
end

def save
  @@all << self
end

def self.create(name)
  song = self.new(name)
  song.save
  song
end

def add_song(song)
  if (!song.artist)
    song.artist = self
  end
  if (!@songs.include?(song))
    @songs << song
  end
end

def self.new_from_filename(filename)
artist_name, song_name, genre_name = filename.gsub(".mp3", "").split(" - ")

artist = Artist.find_or_create_by_name(artist_name)
genre = Genre.find_or_create_by_name(genre_name)
song = self.new(song_name, artist, genre)
end

def self.create_from_filename(filename)
  new_from_filename(filename).save
end
end
