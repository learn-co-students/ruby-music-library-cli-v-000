require 'pry'
class Song

  extend Concerns::Findable

  # extend Concerns::Findable

  @@all = []
  attr_accessor :name 
  attr_reader :artist, :genre
  def initialize(name, artist = nil, genre = nil) 
    @name = name 
    #@genre = genre
    self.artist= artist if artist
    self.genre = genre if genre
  end
  def self.all
    @@all
  end 
  def self.destroy_all
    self.all.clear
  end 
  def save 
    self.class.all << self
  end 
  def self.create(song_name)
    song = Song.new(song_name)
    song.save
    song
  end
  def artist=(artist)
    @artist = artist
    @artist.add_song(self) 
  end 
  def genre=(genre)
    @genre = genre
    @genre.songs << self unless @genre.songs.include?(self)
  end 
  
    
  def self.new_from_filename(filename)
    song = self.new(filename.split(" - ")[1])
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    genre = Artist.find_or_create_by_name(filename.split(" - ")[2])
    song.artist = artist
    
    song
  end 
  
    
  
  
  


end 