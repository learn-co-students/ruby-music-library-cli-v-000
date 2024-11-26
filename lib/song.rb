require 'pry'

class Song 
  attr_accessor :name
  attr_reader :artist, :genre
  extend Concerns::Findable
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
    # @@all << self
  end
  
  def artist=(artist)  
    @artist = artist
    song = self
    if artist != nil 
      artist.add_song(song)
    end
  end
  
  def genre=(genre)
    @genre = genre
    song = self
    if genre != nil && genre.songs.include?(song) == false 
      genre.songs << self
    end
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
  
  def self.create(song)
    new_song = self.new(song) 
    new_song.save
    new_song 
  end
  
  def self.find_by_name(name)
    @@all.detect do |song|
     song.name == name 
    end
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) 
      self.find_by_name(name)
    else self.create(name) 
    end
  end
  
  def self.new_from_filename(filename)
    split_fn = filename.split(" - ")
    name = split_fn[1]
    new_song_obj = Song.new(name)
    new_song_obj.artist = Artist.find_or_create_by_name(split_fn[0])
    long_genre = split_fn[2]
    genre = long_genre.split(".")
    new_song_obj.genre = Genre.find_or_create_by_name(genre[0])
    new_song_obj
    end
  
  def self.create_from_filename(filename)
    new_song_obj = Song.new_from_filename(filename)
    new_song_obj.save
  end
end 

