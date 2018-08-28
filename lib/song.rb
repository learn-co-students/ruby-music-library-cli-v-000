class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if !artist.nil?
      self.artist = artist
    end
    if !genre.nil?
      self.genre = genre
    end
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
    
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end
  
end