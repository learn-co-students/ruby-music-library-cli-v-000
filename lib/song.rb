require 'pry'

class Song
  extend Concerns::Findable
  
  attr_accessor :name, :artist, :genre
  
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
  
  def artist=(name)
    @artist = name
    @artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
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
  
  def self.new_from_filename(filename)
    array = filename.split('.')
    artist, songname, genre = array[0].split(' - ')
    newsong = self.new(songname)
    newsong.artist = Artist.find_or_create_by_name(artist)
    newsong.genre = Genre.find_or_create_by_name(genre)
    newsong
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end