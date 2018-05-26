require "pry"

class Song 

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil) 
    @name = name 
    self.artist= artist unless artist == nil
    self.genre= genre unless genre == nil
  end
  
  def save 
    @@all << self
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save 
    song
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_name = song_array[1]
    artist_name = song_array[0]
    genre_name = song_array[2].chomp(".mp3")
    
    song = Song.find_or_create_by_name(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    song.artist = artist
    song.genre = genre
    song
  end
  
  def self.create_from_filename(filename)
    Song.new_from_filename(filename)
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name) 
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end
  
end 