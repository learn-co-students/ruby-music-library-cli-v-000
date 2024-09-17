require 'pry'
class Song 
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
    genre.songs << self unless genre.songs.include?(self)
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
    song = new(name)
    song.save
    song
  end 
  
  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end 
  
  def self.new_from_filename(file)
    artist, song, genre_name = file.split(" - ")
    genre_fix = genre_name.gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre_fix)
    new(song, artist, genre)
  end 
  
  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end 
end 