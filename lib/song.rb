require 'pry'
class Song 
  extend Concerns::Findable
  @@all = []
  
  attr_accessor :name
  attr_reader :artist, :genre 

  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist 
    self.genre = genre if genre
  end 
  
  def save 
    @@all << self 
  end 
  
  def artist=(artist)
    @artist = artist 
    @artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self if !genre.songs.include?(self)
  end 
  
  def self.create(name)
    new_song = Song.new(name)
    new_song.save 
    new_song 
  end 
  
  def self.all
    @@all 
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1]
    genre_name = filename.split(" - ")[2].gsub(".mp3","")
    artist_name = filename.split(" - ")[0]
    
    song = Song.new(song_name, Artist.find_or_create_by_name(artist_name), Genre.find_or_create_by_name(genre_name))
  end 
  
  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename).save
  end 
  
end 