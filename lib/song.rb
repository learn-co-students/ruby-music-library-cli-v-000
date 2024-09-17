require_relative '../concerns/findable.rb'

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre, :songs

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
   
    self.artist = artist if artist
    self.genre = genre if genre 

    @songs = []

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
    song = Song.new(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find do |x|
      x.name == name
    end
  end

  def self.create_name(name)
    self.new(name).tap {|song| song.save}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_name(name)
    return name
  end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  genre.add_song(self)
end


#Add a new method to the Song class called .new_from_filename that creates a Song based on a filename

  def self.new_from_filename(filename) 
  
    string = filename.split(".").delete_if{|q| q=="mp3"}.join.split(" - ")
   
    #song = self.find_or_create_by_name(string[1])
    genre = Genre.find_or_create_by_name(string[2])
    artist = Artist.find_or_create_by_name(string[0])

    self.new(string[1], artist, genre)
    
  end




#Add a new method to the Song class called .create_from_filename that creates a Song based on a 
#filename and saves it to the @@all class variable

  def self.create_from_filename(filename)
    x = new_from_filename(filename)
    x.save
    x

  end






end