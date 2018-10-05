require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if genre
      self.genre=(genre)
    end
    if artist
      self.artist=(artist)
    end
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    if !genre.songs.detect { |song| song == self }
      genre.songs << self
    end
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end
  
  def self.find_by_name(name)
    all.detect do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.new_from_filename(filename)
    filename_array = filename.split(/\s[-]\s/)
    filename_array[2].chomp!(".mp3")
    
    song = filename_array[1]
    artist = Artist.find_or_create_by_name(filename_array[0])
    genre = Genre.find_or_create_by_name(filename_array[2])
    new(song, artist, genre)
  end
  
  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    new_song.save
  end
  
end