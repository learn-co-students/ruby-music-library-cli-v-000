require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable
  
  @@all = []
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=artist unless artist.nil?
    self.genre=genre unless genre.nil?
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    self.new(name).tap {|song| song.save}
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    name = filename[1]
    artist = Artist.find_or_create_by_name(filename[0])
    genre = Genre.find_or_create_by_name(filename[2].split(".")[0])
    song = self.new(name, artist, genre)
    song
  end
  
  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
  end
end

