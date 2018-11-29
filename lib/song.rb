require 'pry'

class Song
  
  attr_accessor :name, :add_song
  
  attr_reader :artist, :genre
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name,artist=nil,genre=nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
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
    song = self.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end
  
  def self.find_by_name(name)
    self.all.detect { |song| song.name === name }
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    genre_with_file_extension = filename.split(" - ")[2]
    genre = genre_with_file_extension.split(".mp3")[0]
    name = filename.split(" - ")[1]
    # binding.pry
    song = self.new(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end
  
  def self.create_from_filename(filename)
    artist = filename.split(" - ")[0]
    genre_with_file_extension = filename.split(" - ")[2]
    genre = genre_with_file_extension.split(".mp3")[0]
    name = filename.split(" - ")[1]
    self.new_from_filename(filename)
    song = self.create(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

end