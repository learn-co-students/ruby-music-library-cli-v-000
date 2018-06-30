class Song 
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
  
  # def self.find_by_name
  #   @@all.detect {|artist| artist.name == name}
  # end
  
end
  