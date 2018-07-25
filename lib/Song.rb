require 'pry'

class Song
extend Concerns::Findable

attr_accessor :name, :artist, :genre

@@all =[]

def initialize(name, artist=nil, genre=nil)
   @name = name
  #  @artist = artist
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
artist.add_song(self)
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

# def self.new_from_filename(filename)
# split_file = filename.split(" - ")
# artist_name = split_file[0]
# song_name = split_file[1]
# genre_name = split_file[2].gsub(".mp3", "")
# self.new(artist_name, song_name, genre_name)
# end

def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1]
    genre_name = parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    self.new(song_name, artist, genre)
  end




end
