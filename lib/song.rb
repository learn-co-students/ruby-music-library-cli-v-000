require 'pry'

class Song

  attr_accessor :name, :artist, :genre
  attr_reader

  @@all = []

  def initialize(name, artist=nil,genre=nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

def artist=(artist)
  @artist = artist
  if artist
    artist.add_song(self)
  end
end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end


def genre=(genre)
  @genre = genre
  if genre
    genre.songs << self unless genre.songs.include?(self)
  end
end

def self.new_from_filename(filename)
  artist_name = filename.split(" - ")[0]
  song_name = filename.split(" - ")[1]
  genre_name = filename.split(" - ")[2].gsub(".mp3","")
  song = self.new(song_name)
  song.artist = Artist.find_or_create_by_name(artist_name)
  song.genre  = Genre.find_or_create_by_name(genre_name)
  song

end

def self.create_from_filename(filename)
  new_from_filename(filename).tap{ |s| s.save }

end

end #Song class
