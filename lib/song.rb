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
    @artist = file_split[0].chomp
    @song =  file_split[1] .chomp
    song = self.new(song)
    binding.pry
  end  
  
end