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
  
  def save
    @@all << self 
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end
  
  def self.new_from_filename(file)
    filename = file.split(' - ')
    song = filename[1]
    artist = Artist.find_or_create_by_name(filename[0])
    genre = Genre.find_or_create_by_name(filename[2].split('.mp3').join)
    new_song = Song.new(song, artist, genre)
  end
  
  def self.create_from_filename(file)
    @@all << new_from_filename(file)
  end
  
end