class Genre
  
attr_accessor :name 
@@all = []

  def initialize(name) 
    @name = name
    @songs = []
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
  
   def artists
    self.songs.collect {|song| song.artist}.uniq
  end
  
  def songs 
    @songs 
  end
  
end
