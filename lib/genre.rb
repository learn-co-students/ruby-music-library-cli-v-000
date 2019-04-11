class Genre
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
  
  def self.create(new_genre) 
    n_g = Genre.new(new_genre)
    n_g.save
    n_g
  end 
  
  # def new 
    
  # end 
  
end   
  