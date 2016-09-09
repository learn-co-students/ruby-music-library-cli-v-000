class Genre
    attr_accessor:name, :songs
    
    extend Concerns::Findable
    
    @@all = []
    
    def initialize(name)
        @name = name
        @songs = []
    end
    
    def self.all
        @@all
    end
    
    def self.destroy_all
        self.all.clear
    end
    
    def save
        self.class.all << self
    end
    
    def artists
        artist_array = []
        self.songs.each do |song|
            artist_array << song.artist
        end
        artist_array.uniq
    end
end