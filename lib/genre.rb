class Genre
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :songs
    @@all = []
    
    def initialize(name)        
        @name = name
        @songs = []
        self
    end
    
    def save
        self.class.all << self
    end
    
    def add_song(song)
        if song.class == Song
            @songs << song
            song.genre = self
        end
    end
    
    def artists
        a = []
         @songs.each do |song|
            if !a.include?(song.artist)
                a << song.artist
            end
        end
        return a
    end
    
    #CLASS METHODS
    def self.all
        @@all
    end
    
    def self.destroy_all
        self.all.clear
    end
    
    def self.create(name)
        genre = self.new(name)
        genre.save
        return genre
    end
end