class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist #!= nil
    self.genre = genre if genre
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
    @@all << self
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
    @@all = []
  end
  
  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
  
  def self.new_from_filename(filename)
    properties = filename.split(" - ")
    artist_name, song_name, genre_name = properties[0], properties[1], properties[2].gsub(".mp3", "")
    
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    
    new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    new_song.save
  end
  
end