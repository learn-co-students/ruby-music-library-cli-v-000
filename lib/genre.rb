class Genre
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :songs
    @@all = []
    
    def initialize(name)
        @name = name
        @songs = []
    end
    
    def artists
        self.songs.collect {|s| s.artist}.uniq
    end
    
    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def self.destroy_all
        self.all.clear
    end

    def self.create(name)
        song = self.new(name)
        song.save
        song
    end
end

#Genres have many artists through their songs. Implement an #artists method for this association.
