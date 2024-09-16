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
    @@all << self
  end
  
  def self.create(name)
    song = self.new(name)
    song.save 
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre 
    genre.add_song(self) 
  end
  
  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end
  
  def self.new_from_filename(filename)
    info = File.basename(filename, ".mp3").split(' - ')
    Song.new(info[1], Artist.find_or_create_by_name(info[0]), Genre.find_or_create_by_name(info[2]))
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save 
    song
  end
    
  

end