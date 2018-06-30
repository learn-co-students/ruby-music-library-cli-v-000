class Artist 
  extend Findable
  attr_accessor :name
  
  @@all = []
  
  def self.all
    @@all 
  end
  
  def initialize
    save
  end
  
  def save
    @@all << self
  end
  
  def destroy_all
    @@all.clear
  end
  
  def self.count
    @@all.size
  end
  
end