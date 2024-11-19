class Genre
    extend Concerns::Findable
    
    attr_accessor :name
    
    @@all = []
    
    def initialize(name)
        @name = name
        @songs = []
    end 
    
    def self.all
        @@all
    end 
    
    def artists
         artists = songs.collect {|songs| songs.artist}
         artists.uniq
    end 
    
    def songs
        @songs
    end 
    
    def self.destroy_all
        @@all.clear
    end 
    
    def save
        @@all << self
    end 
    
    def self.create(name)
        self.new(name).tap {|a| a.save}
    end
        
    
end