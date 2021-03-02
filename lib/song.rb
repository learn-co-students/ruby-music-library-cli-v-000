require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre 
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    
    # @artist = artist
    self.artist=(artist) if artist != nil
    
    self.genre=(genre) if genre != nil
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
  
  #-------------------------------------
  # This method is dspite the attr_accessor for artist
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end  
  
  #-------------------------------------
  
  
  # This method is dspite the attr_accessor for genre
  
  def genre=(genre)
    @genre= genre
    @genre.songs <<  self if !genre.songs.include?(self)
  end  
  
  #-------------------------------------
  
  def self.find_by_name(name)
  @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
          return song if song 
          song = self.create(name)
  end
  
  def self.new_from_filename(file)
    # binding.pry
    song_name = file.split(" - ")[1]
    
    artist = Artist.find_or_create_by_name(file.split(" - ")[0])
    
    genre = Genre.find_or_create_by_name(file.split(" - ")[2].chomp(".mp3"))
    
    song = self.new(song_name, artist, genre)
    # binding.pry
  end
  
  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end  
  
   
end


