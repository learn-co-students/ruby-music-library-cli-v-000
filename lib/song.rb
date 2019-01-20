class Song 
  attr_accessor :name, :genre  
  attr_reader :artist
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    @artist = artist
    @genre = genre
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
  
  def self.create(song_name)
    song_created = Song.new(song_name)
    song_created.save
    song_created
  end
  
 def artist=(artist)
   song = self
   @artist = artist
   artist.add_song(song)
 end
  
end