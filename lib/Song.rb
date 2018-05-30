class Song
  extend Concerns::Findable
  attr_accessor :name, :genre, :artist
  @@all = []
  
  def initialize(name, artist=nil)
    @name = name
    self.artist = artist if artist
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
    
  def self.all 
   @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.find_by_name(song_name)
    self.all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.new(song_name)
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
end
