class Song
  extend Concerns::Findable
   
  attr_accessor :name 
  attr_reader :artist, :genre 
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist 
    self.genre = genre if genre 
  end
  
  def genre=(genre)
    @genre = genre 
    unless genre.songs.include?(self)
    genre.songs << self 
    end
  end
  
   def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end
  
  def save
    @@all << self 
  end
  
   def self.create(name)
    song = new(name)
    song.save 
    song 
  end
  
  def self.new_from_filename
    
  end
  
  def self.create_from_filename 
    
  end
  
  def self.all
    @@all 
  end
  
  def self.destroy_all
    @@all.clear
  end
    
  
end