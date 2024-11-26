class Song 
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = [] 
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
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
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song 
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    song = filename.split(" - ")
    name = song[1]
    artist = song[0]
    genre = song[2].chomp(".mp3")
    
    new_artist = Artist.find_or_create_by_name(artist)
    new_genre = Genre.find_or_create_by_name(genre)
    
    self.new(name, new_artist, new_genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end 