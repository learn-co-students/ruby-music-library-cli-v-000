class Song 
  attr_accessor :name
  attr_reader :artist, :genre
  extend Concerns::Findable
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist 
    self.genre = genre if genre
  end 
  
  def genre=(genre)
    @genre = genre
    self.genre.add_song(self)
  end
  
  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end
  
  def self.all 
    @@all
  end
  
  def save 
    self.class.all << self
  end
  
  def self. destroy_all 
    self.all.clear
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end 
    
  def self.new_from_filename(filename)
    song = self.new(filename.split(' - ')[1])
    artist = Artist.find_or_create_by_name(filename.split(' - ')[0])
    genre = Genre.find_or_create_by_name(filename.split(' - ')[2].split('.')[0])
    song.artist = artist 
    song.genre = genre
    song
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
  
end 
