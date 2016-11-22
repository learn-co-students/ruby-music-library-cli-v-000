require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  
  @@all = [] 

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    artist = file[0]
    name = file[1]
    genre = file[2].gsub(".mp3", "")
   
    song = self.new(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end  

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
    
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.create(name, artist = nil, genre = nil)
    song = Song.new(name, artist = nil, genre = nil)
    song.save
    song
  end  
end  



# file = filename.split(" - ")
#     artist_name = file[0]
#     name = file[1]
#     genre_name = file[2].gsub(".mp3", "")
    
#     artist = Artist.find_or_create_by_name(artist_name)
#     genre = Genre.find_or_create_by_name(genre_name)
#     song = self.new(name)
#     song.save
#     song



