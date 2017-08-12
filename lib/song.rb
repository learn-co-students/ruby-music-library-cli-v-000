class Song   
  
  attr_accessor :name , :genre
  attr_reader :artist

  @@all = []

  def initialize(name,artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    self.class.all << self
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
    genre.songs << self unless genre.songs.include?(self)
  end
  
  
  
  

  
  
  
end