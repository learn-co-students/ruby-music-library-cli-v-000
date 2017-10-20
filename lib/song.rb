require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
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
    genre.add_song(self)

end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def song
    @song
  end

  def self.all
    @@all
end
  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(filename)
     components = filename.split(" - ")
     artist_name = components[0]
     song_name = components[1]
     genre_name = components[2].gsub(".mp3", "")
     artist = Artist.find_or_create_by_name(artist_name)
     genre = Genre.find_or_create_by_name(genre_name)
     new(song_name, artist, genre)
   end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
end
