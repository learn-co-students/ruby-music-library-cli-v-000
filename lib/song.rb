class Song 
  @@all = []
  attr_accessor :name, :artist 
  
  
  def initialize(name, artist = nil)
    @name = name
    @@all << self
    @artist = artist 
    self.artist=(artist) if artist
  end 
  
  def self.all 
    @@all
  end

  def self.destroy_all
    @@all.clear 
  end 
  
    def save 
      self.class.all << self
    end 
    
    def self.create(name)
      song = self.new(name)  
      self.all << song
      song
    end
    
    def artist=(artist)
      @artist = artist
      artist.add_song(self) 
     
    end
end
  