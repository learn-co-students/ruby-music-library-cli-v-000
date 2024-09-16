
require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist #if there *is* an artist
    self.genre = genre if genre 
  end

  def self.create(title)
    song = self.new(title)
    song.save
    song
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
    #artist.name = name
    song.save
    song #why do i need to return this to pass test?
  end

  def artist=(artist)
    @artist = artist
    artist.songs << self
    artist.add_song(self)
  end

  def add_song(name)
    self.artist = name
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self 
    end
  end

  def self.new_from_filename(filename)
    ary = filename.split(" - ")
    title = ary[1]

    artist = Artist.find_or_create_by_name(ary[0])
    genre = Genre.find_or_create_by_name(ary[2].delete(".mp3"))
  
    song = self.new(title, artist, genre)
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end
#Add a new method to the Song class called 
#.create_from_filename that creates a Song 
#based on a filename and saves it to the @@all class variable

  

end
