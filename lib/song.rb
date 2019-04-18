class Song
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name, artist=nil)
    @name = name
    self.artist = artist unless artist.nil?
    
  end 
  
  def save
    @@all << self
  end
  
  def self.all 
    @@all
  end 
  
  def self.destroy_all
    # self.@@all.clear
    @@all = []
  end 
  
  def self.create(new_song) 
    n_s = Song.new(new_song)
    # new_song.initialize doesn't work because #initialize is automatically run when a new instance of the class is created
    n_s.save
    n_s
  end 
  
end   
  