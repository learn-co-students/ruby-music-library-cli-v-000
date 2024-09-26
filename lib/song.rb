class Song 
  attr_accessor :name, :artist, :genre 
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist 
    self.genre = genre if genre 
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
    @@all.clear 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(song)
    song = Song.new(song) 
    song.save 
    song 
  end 
  
  def self.find_by_name(name)
    all.detect {|s| s.name == name}
  end 

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name) 
  end 
  
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist, @name, genre = parts[0], parts[1], parts[2].gsub(".mp3", "")
    @artist = Artist.find_or_create_by_name(artist)
    @genre = Genre.find_or_create_by_name(genre)
    self.new(@name, @artist, @genre) 
  end 
  
  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end 
end 