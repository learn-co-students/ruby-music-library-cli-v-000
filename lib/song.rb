class Song 
  
  @@all = []
  
  attr_accessor :name, :artist, :genre 
  
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
    self.class.all << self
  end 
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song 
  end 
  
  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end 
  
  def artist=(artist)
    @artist =artist
    artist.add_song(self)
  end
  
  def self.new_from_filename(filename)
    filename = filename.gsub(".mp3","")
    artist_name, song_name, genre_name = filename.split(" - ")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end 
  
  def self.find_by_name(name)
    self.all.detect{|song| song.name == name} 
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end 
end 