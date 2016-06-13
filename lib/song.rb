

class Song
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable
  
  @@all = []
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=artist unless artist.nil?
    self.genre=genre unless genre.nil?
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    self.new(name).tap {|song| song.save}
  end
  
  def self.destroy_all
    self.all.clear
  end
end