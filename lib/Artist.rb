class Artist
    extend Concerns::Findable
    
        attr_accessor :name
    
    @@all = []
    
    def initialize(name)
        @name = name
        @songs = []
    end
    
    def add_song(song)
        @songs << song unless @songs.include?(song)
        song.artist ? song = self : song.artist = self
    end
    
    
    def genres
        genres = songs.collect {|songs| songs.genre}
        genres.uniq
    end 
    
    
    def songs
        @songs
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
        self.new(name).tap {|a| a.save}
    end
        
    
end

