require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  
 
  @@all= []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end 
    
    if genre != nil
      self.genre = genre
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
    self
  end  
  
  def self.create(song)
    song = self.new(song)
    song.save
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end  
  
  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end 
  
  def self.new_from_filename(file)
   file_split = file.split('-')
    @artist = file_split[0].strip
    @song =  file_split[1].strip
    @genre = file_split[2].split('.')[0].strip
    song = self.new(@song)
    artist = Artist.find_or_create_by_name(@artist)
    song.artist = artist
    genre = Genre.find_or_create_by_name(@genre)
    song.genre = genre
    song
  end  
  
  def self.create_from_filename(file)
      @@all << new_from_filename(file)
  end
end