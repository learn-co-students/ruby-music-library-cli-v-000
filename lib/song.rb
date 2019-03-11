require 'pry'
#require '/concerns/findable.rb'

class Song
 
  attr_accessor :name 
  attr_reader :artist, :genre 

  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    #@artist = artist 
    self.artist = artist if artist != nil 
    self.genre = genre if genre != nil 
    #@@all << self 
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    #Song.artist = artist 
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre =  genre 
    genre.add_song(self)
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save 
    @@all << self 
  end
  
  def self.create(name)
    song = self.new(name)
    @@all << song 
    song
  end
  
   def self.create_by_name(name)
    song = self.new(name)
    song.name = name
    #binding.pry
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
    #binding.pry 
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil 
      self.find_by_name(name)
    else 
      #self.create_by_name(name)
      self.create(name)
      #binding.pry
    end
  end
  
  def self.new_from_filename(filename)
    split_file = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(split_file[0])
    genre = Genre.find_or_create_by_name(split_file[2])
    self.new(split_file[1], artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

end
