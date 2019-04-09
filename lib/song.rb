class Song
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name

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
    @new_song = new_song
    @new_song.initialize
    @new_song.save
    return new_song
  end 
  
  # def new 
    
  # end 
  
end   
  