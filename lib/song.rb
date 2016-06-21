class Song
  attr_accessor :name, :artist 
  
  @@all = [] 

  def initialize(name)
    @name = name  
    @@all << self 
  end

  def artist=(artist)
   @artist = artist
   artist.songs << self
  end


  def Song.all 
    @@all 
  end 

  def Song.destroy_all 
    self.all.clear 
  end

  def save 
    @@all
  end

  def Song.create(song)
    item = Song.new(song)
  end
end
