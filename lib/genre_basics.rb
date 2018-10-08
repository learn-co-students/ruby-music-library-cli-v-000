class Genre
  attr_accessor :name, :songs 

  
   @@all = []
   
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def songs 
    @songs 
  end 
  
  def self.create(name)
    created_genre = Genre.new(name)
    created_genre.save 
    created_genre 
  end 
  
  def self.all 
    @@all 
  end 
  
  def save
    self.class.all << self 
  end 
  
  def self.destroy_all
    @@all.clear 
  end 

end 