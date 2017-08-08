class Song   
  
  attr_accessor :name
  attr_reader :artist

  @@all = []

  def initialize(name)
    @name = name
  end
  
  def self.all
    @@all
  end
  
  def destroy_all
    @@all = []
  end

  
  
  
end