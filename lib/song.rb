class Song 
  attr_accessor :name 
  attr_reader :artist, :genre 
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist 
    self.genre = genre if genre 
  end 
  
  def save 
    @@all << self 
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.add_song(self)
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 
  
  def self.create(song)
    song = Song.new(song)
    song.save 
    song
  end 
  
  def self.find_by_name(song_name)
    self.all.detect { |song| song.name = song_name }
  end
  
  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create(song_name)
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    @@all.clear 
  end 
  
end 