require 'pry'
class Song
  @@all = []
  attr_accessor :name, :artist
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil 
      self.artist=(artist)
    end
     if genre != nil 
      self.genre=(genre)
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
    new_song = Song.new(song)
    new_song.save
    new_song
  end
  
  def artist=(artist)
    @artist=artist
    artist.add_song(self)   
  end
  
  def artist
    @artist
  end
  
  def genre
    @genre  
  end
  
  def genre=(genre)
    @genre=genre
    genre.add_song(self)
  end
  
  def self.find_by_name(name)
    all.detect {|s| s.name == name}
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
    
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
end