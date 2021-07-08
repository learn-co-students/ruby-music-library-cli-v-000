class Song 
  attr_accessor :name, :artist, :genre 
  @@all = []
  
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
  
  def self.create(name, artist = nil, genre = nil)
    self.new(name, artist, genre).tap{|song| song.save}
  end
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")
    
    artist_name = Artist.find_or_create_by_name(artist_name)
    genre_name = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist_name, genre_name)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end