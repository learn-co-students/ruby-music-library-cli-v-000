require 'pry'
class Song
  extend Concerns::Findable
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
   
  def self.find_by_name(song_name)
    self.all.detect do |song|
      song.name == song_name
    end 
  end 
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) ? self.find_by_name(song_name) : self.create(song_name) 
  end 
    
  
  
  


end 