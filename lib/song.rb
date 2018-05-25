class Song 
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil) 
    @name = name 
    self.artist= artist unless artist == nil
    self.genre= genre unless genre == nil
  end
  
  def save 
    @@all << self
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
    @@all = []
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save 
    song
  end
  
end 