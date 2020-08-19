class Genre
    
    extend Concerns::Findable
    # extend Concerns::ClassMethod
    
    attr_accessor :name, :artist
    
     @@all = []
    
    def initialize(name)
      @name = name
      @@all = []
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
    end
    
    def self.create(name)
      genre = self.new(name)
      genre.save
      genre
    end
    
    def songs
      @songs
    end
    
    # #artists
    #   returns a collection of artists for all of the genre's songs (genre has many artists through songs) (FAILED - 3)
    
    #   does not return duplicate artists if the genre has more than one song by a particular artist (genre has many artists through songs) (FAILED - 4)
    
    #   collects artists through its songs instead of maintaining its own @artists instance variable (genre has many artists through songs)
    
    def artists
      songs.map{|song| song.artist}.uniq
    end
    
    def self.find_or_create_by_name(name)
      
      # genre = @@all.find{|a| a.name == name}
      
      genre = self.find_by_name(name)
      return genre if genre
      genre = self.create(name)
      
    end  
      
end 