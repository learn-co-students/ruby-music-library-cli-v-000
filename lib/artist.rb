class Artist 
  extend Concerns::Findable
  attr_accessor :name, :artist  
  @@all = [] 
  
  def self.all 
    @@all 
  end 
  
  def initialize(name) 
    @name = name
    @songs = []
  end 
  
  def self.destroy_all 
    @@all = [] 
  end 
  
  def save 
    @@all << self
  end 
  
  def self.create(name)
    new(name).tap {|s| s.save} 
  end 
  
  def songs
    @songs
  end 
  
  def add_song(song)
    
    song.artist = self unless song.artist 
    songs << song unless songs.include?(song)
    
    #song.artist = self
    # song.artist << song if song.artist("")
    #artist.add_song(song)
    #self.new(song_name, artist, genre)
    #artist << add_song
    #song << self
      
  end
 
   def genres
    songs.collect{ |s| s.genre }.uniq
  end
    
  # end 
 
  
end