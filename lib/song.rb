class Song 
  extend Concerns::Findable
  attr_accessor :name, :genre, :artist 
  
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
  
  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap {|s| s.save} 
  end
  
  def self.find_by_name(name)
    @@all.detect {|s| s.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    split_name = filename.split(" - ")
    song = self.new(split_name[1])
    artist = Artist.find_or_create_by_name(split_name[0])
    genre = Genre.find_or_create_by_name(split_name[2].gsub(".mp3",""))
    song.artist = artist
    song.genre = genre
    artist.add_song(song)
    song
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).tap{|s| s.save}
  end
      
end 