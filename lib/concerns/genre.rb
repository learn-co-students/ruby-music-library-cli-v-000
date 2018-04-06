class Genre
     attr_accessor :name
     
     @@all = []
     
     
    def initialize(name)
      @name = name
      @songs = []
    end  
  
    def self.all
      @@all
    end  
    
    def self.destroy_all
      @@all.clear
    end  
    
    def save
      @@all << self
      self
    end  
    
    def self.create(name)
      genre = self.new(name)
      genre.save
    end  
    
    def songs
      @songs
    end  
    
    
      
end