class Artist
    attr_accessor :name
    attr_reader :songs
    
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
        @@all.clear
    end
    
    def save
        @@all << self
    end
    
    def genres
        songs.map {|a| a.genre}.uniq
    end
    
    def self.create(name)
        a = self.new(name).tap {|a| a.save}
    end
    
    def add_song(song)
        if !song.artist
            song.artist = self
        end
        if !@songs.include? song
            @songs << song
        end
    end
end
