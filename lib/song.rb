require "pry"
class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []
 
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
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
    song = new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
  def self.new_from_filename(filename)
    song_name = filename[/- (.+?) -/, 1]
    artist = Artist.find_or_create_by_name(filename[/(.+?) -/, 1])
    genre = Genre.find_or_create_by_name(filename[/- (\S+\s?\S+).mp3/, 1])

    Song.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end
end
