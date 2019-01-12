class Song
  
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    @@all << self
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include? self
  end
  
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(song)
    song = self.new(song)
  end
  
  def self.find_by_name(songName)
    self.all.find {|song| song.name == songName }
  end
    
  def self.find_or_create_by_name(songName)
    self.find_by_name(songName) ? self.find_by_name(songName) : self.create(songName)
  end
  
  def self.new_from_filename(filename)
    song = filename.split(" - ")[1]
    newSong = self.new(song)
    artist = filename.split(" - ")[0]
    newSong.artist = artist
    newSong
  end


end