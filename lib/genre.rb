class Genre   
  
  attr_accessor :name
  

  @@all = []

  def initialize(name)
    @name = name
    @@all = []
  end
  
  def self.all
    @@all
  end
  
  def destroy_all
    @@all = []
  end

  
  
  
end