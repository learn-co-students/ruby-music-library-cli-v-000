class Song 
  
attr_accessor :name 
@@all = []

  def initialize(name) 
    @name = name
    songs = []
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
  
  def self.create
    song = self.new
    self.all << song
    song
  end
  
end
