class Artist 
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name=name 
    @songs = []
  end 

  
  def save
  @@all << self 
  end 

  def self.all
  @@all
  end 

  def self.destroy_all
  @@all.clear 
  end 

  def self.create(name)
    new_artist = Artist.new(name)
    @@all << new_artist
    new_artist
  end 

    def add_song(name)
    if @artist != nil 
      self.artist.name 
    else 
      nil 
    end 
    
  end 
  
end 
