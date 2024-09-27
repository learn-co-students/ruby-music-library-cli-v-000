#require 'pry'
#require_relative './concerns/basic_build_module.rb'

class Song 
  
  attr_accessor :name, :artist, :genre 
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    if genre 
      self.genre = genre
    end
    if artist
      self.artist = artist 
    end
  end

  def save
    self.class.all << self
  end
  
  def self.all 
      @@all 
  end
    
  def self.destroy_all
    self.all.clear     
  end
    
  def self.create(name)
    self.new(name).tap do |instance|
      instance.save
    end
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre 
    genre.add_song(self)
  end
  
  def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create(name)
    end
  end
  
  def self.new_from_filename(filename)
   split_file = filename.split(' - ')
    #extract name of song 
    name = split_file[1]
    #create an instance of the artist class 
     artist = Artist.find_or_create_by_name(split_file[0])
    #create an instance of the genre class
    genre = Genre.find_or_create_by_name(split_file[2].sub('.mp3', ''))
    self.new(name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end