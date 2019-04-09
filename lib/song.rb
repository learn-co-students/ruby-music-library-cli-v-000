class Song
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    name = @name
  end 
  
  def save
    @@all << self
  end
  
  def all 
    @@all
  end 
  
  def destroy_all
    @@all.delete_all
  end 
  
  def create(new_song) 
    create = Song.new
    save = @@all << Song.new
    Song.new
  end 
  
  def new 
    
  end 
  
end   
  