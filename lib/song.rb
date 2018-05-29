require 'pry'
class Song 
  
  
  attr_accessor :name, :genre
  attr_reader :artist
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
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
  
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end
  
  def genre_name=(name)
    self.genre = Genre.find_or_create_by_name(name)
    genre.songs << self
  end
    
  
  def self.find_by_name(title)
    @@all.find {|s| s.name == title}
   end 
  
  def self.create(title)
    self.new(title).tap {|s| s.save}
  end 
  
  def self.find_or_create_by_name(title)
    self.find_by_name(title) ? self.find_by_name(title) : self.create(title)
  end
  
  def self.new_from_filename(name)
    song = Song.new(name.split(" - ")[1])
    song.artist_name = name.split(" - ")[0]
    song.genre_name = name.split(" - ")[2].split(".mp3")[0]
    song
  end
  
  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end 
    
end