require 'pry'
class Song 
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    if artist != nil 
      self.artist = artist
    end 
    if genre != nil 
      self.genre = genre 
    end 
    @@all << self 
  end 
  
  def self.all 
    @@all
  end 
  
  def self.destroy_all
    @@all = [] 
  end 
  
  def save 
    if !@@all.include?(self)
      @@all << self 
    end 
  end 
  
  def self.create(name)
    new_song = Song.new(name)
    new_song.name = name 
    new_song.save 
    new_song
  end 
 
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre 
    if !genre.songs.include?(self)
      genre.songs << self 
    end 
  end 
  
  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name 
    end 
  end 
  
  def self.find_or_create_by_name(name)
    return_value = self.find_by_name(name)
    if return_value
      return_value
    else 
      self.create(name)
    end
  end
  
  def self.new_from_filename(file_name)
    split_files = file_name.split(/\-|\./)
    
    artist_name = split_files[0]
    song_title = split_files[1]
    song_genre = split_files[2]
    
    split_artist = artist_name.split 
    joined_artist = split_artist.join(" ")

    split_title = song_title.split 
    joined_title = split_title.join(" ")

    split_genre = song_genre.split 
    joined_genre = split_genre.join(" ")
    if joined_genre == "hip"
      joined_genre = "hip-hop"
    end 

    new_song = Song.new(joined_title)
    
    the_artist = Artist.find_or_create_by_name(joined_artist)
    the_genre = Genre.find_or_create_by_name(joined_genre)
    the_artist.add_song(new_song)
    the_genre.add_song(new_song)
    new_song
  end 
  
  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save 
    
  end 
  
end 