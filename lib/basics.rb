class Basics
attr_accessor :name
  
  @@all = []

  def initialize(name)
    @name = name 
  end
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    @@all.clear
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    instance = self.new(name)
    instance.save
    instance
  end 
end 