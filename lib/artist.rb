class Artist 
  @@all = []
  attr_accessor :name
  
  
  def initialize(name)
    @name = name
    @@all << self 
    @songs = []
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
      artist = self.new(name)  
      self.all << artist 
      artist
    end

  
      
    
end