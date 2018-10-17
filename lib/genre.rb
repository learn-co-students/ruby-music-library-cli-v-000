class Genre 
  attr_accessor :name 
  @@all = []
  
  def initialize(name)
    @name = name
    
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    self.all.clear 
  end 
  
  def save 
    self.class.all << self 
  end 
  
  def self.create(name)
    Genre.new(name).tap do |song|
      song.save
    end 
  end 

end 