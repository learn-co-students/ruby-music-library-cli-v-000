class Song 
  
  @@all
  
  def initialize(song_name)
    @name = name 
    @@all = []
  end 
  
  def name=(song_name)
    @name = song_name
  end 
  
  def name 
    @name 
  end 
  
  def self.all 
    @@all 
    self.save
  end 
  
  
  def self.destroy_all 
    @@all.clear 
  end 
  
  def save 
    @@all << self 
  end 
  
  
  def self.create(song_name) 
    new_song = self.new(song_name)
    @@all << new_song 
    new_song
  end 
  
  
  
  
end 