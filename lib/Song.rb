require 'pry'
class Song


  extend Concerns::Findable

  # extend Concerns::Findable


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
    song = Song.new(filename.split(" - ")[1])
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    genre = Genre.find_or_create_by_name(filename.split(" - ")[2].gsub(".mp3",""))
    song.artist = artist
    song.genre = genre
    song
  end 
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end 
  
    
  
  
  


end 