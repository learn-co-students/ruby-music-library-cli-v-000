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
    @@all = []
  end 
  
  def self.create(name)
    name = self.new(name)
    name.save
    name
  end 
end 