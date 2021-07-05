class Song 
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre 
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    self.artist=(artist) if artist
    self.genre=(genre) if genre  
  end 
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end 
  
  def self.all
    @@all
  end
  
  def self.destroy_all
  @@all.clear
 end 

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
  def save
    self.class.all << self
  end
  
 def self.find_by_name(name)
  result = nil 
  @@all.each do |song|
  result = song if song.name == name
 end 
 result
 end 
 
 def self.new_from_filename(file)
    artist_name = file.split(" - ")[0]
    song_name = file.split(" - ")[1]
    genre_name = file.split(" - ")[2].chomp(".mp3")
    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song 
  end

def self.create_from_filename(file)
  file = self.new_from_filename(file)
  file 
end 
 
 def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create(name) 
end 

 end 
