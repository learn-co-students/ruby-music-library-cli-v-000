class Genre 
  @@all = []
  attr_accessor :name 
  
  def initialize(name)
    @name = name
    @@all << self 
  end
  
    def self.all 
    @@all.each do |song|
      puts song.name
    end 
  end

  def self.destroy_all
    @@all.clear 
  end 
  
    def save 
      self.class.all << self
    end 
    
    def self.create(name)
      genre = self.new(name)  
      self.all << genre 
      genre 
    end
end