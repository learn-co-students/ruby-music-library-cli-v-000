require "pry"
class Song 
  
  attr_accessor :name
  attr_reader :artist, :genre 
  
  @@all = []
  
  def initialize(name, artist_object=nil, genre_object=nil)
    @name = name 
    if artist_object !=nil
      self.artist=(artist_object)
    end
    if genre_object !=nil 
      self.genre=(genre_object)
    end
  end
  
  def genre=(genre_object)
    @genre = genre_object 
    unless self.genre.songs.include?(self)
    self.genre.songs << self
  end
  end
  
  def artist=(artist_object)
    @artist = artist_object
    self.artist.add_song(self)
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
    song = self.new(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
     self.all.detect do |each_song|
      each_song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) 
     self.find_by_name(name) 
    else 
      self.create(name)
    end
  end
  
  def self.new_from_filename(file_name)
    file_artist = file_name.split(" - ")[0]
    file_song = file_name.split(" - ")[1]
    file_genre = file_name.split(" - ")[2]
    file_genre_split = file_genre.split(".")[0]
    song = self.new(file_song)
    song.artist = Artist.find_or_create_by_name(file_artist)
    song.genre = Genre.find_or_create_by_name(file_genre_split)
    song
  end
  
  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end
  
end