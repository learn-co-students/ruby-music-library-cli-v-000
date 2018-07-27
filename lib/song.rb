require "pry"
class Song 
  attr_accessor :name 
  attr_reader :artist, :genre 
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all 
    @@all.clear 
  end
  
  def save 
    if !Song.all.include?(self)
      @@all << self
    end
    self
  end
  
  def self.create(name) 
    song = self.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre) 
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
     @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else 
      self.create(name)
    end
  end
  
  def self.new_from_filename(filename)
    file = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(file[0])
    genre = Genre.find_or_create_by_name(file[2])
    new_song = Song.find_or_create_by_name(file[1])
    new_song.artist = artist
    new_song.genre = genre
    new_song
  end 
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end