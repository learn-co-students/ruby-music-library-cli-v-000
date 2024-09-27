require 'pry'

class Song
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @genre = genre
    if artist != nil
      self.artist = artist
    else @artist = artist
    end
    if genre != nil
      self.genre = genre
    else @genre = genre
    end
    save
  end
  
  def self.all
    @@all
  end
  
  def self.create(name)
    song = Song.new(name)
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
    data = filename.split(" - ")
    song_name = data[1]
    artist_name = data[0]
    genre_name = data[2].split(".mp3").join
    s = self.new(song_name)
    a = Artist.find_or_create_by_name(artist_name)
    g = Genre.find_or_create_by_name(genre_name)
    s.artist = a
    s.genre = g
    s
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
  
end