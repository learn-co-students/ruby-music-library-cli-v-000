require 'pry'
class Song 
  extend Concerns::Findable
  
   @@all = []
  
  attr_accessor :name, :artist, :genre 
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist!=nil
    self.artist= artist
    end 
    if genre!=nil
    self.genre= genre
  end 
  end 
  
  def self.all 
    @@all
  end 
  
  def save
    @@all << self 
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
   def self.create(name)
   new_instance= self.new(name)
   new_instance.save
   new_instance
  end 
  
  # ---- Passing 001 

  # ----- 004 
  
  def artist=(artist)
    @artist=artist 
    artist.add_song(self)
  end 
        
  def genre=(genre)
    @genre=genre 
    if genre.songs.include?(self)
    else 
    genre.songs << self 
  end 
end 


# def self.find_or_create_by_name(name)
#  if song = self.find_by_name(name)
#    song
#    else 
#    song = self.create(name) 
#    end 
#  end 
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

def self.new_from_filename(file_name)
  #if file_name !=nil 
  file_name_parsed = file_name.split(" - ")
  name = file_name_parsed[1]
 new_song = Song.find_or_create_by_name(name)
  new_found_artist= Artist.find_or_create_by_name(file_name_parsed[0])
  new_song.artist = new_found_artist 
  new_found_artist.add_song(new_song) 
  new_found_genre = Genre.find_or_create_by_name(file_name_parsed[2].chomp(".mp3"))
  new_song.genre = new_found_genre 
  new_song 
#end 
  end 
   
def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end 
  
end 