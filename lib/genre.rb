class Genre
    attr_accessor :name, :songs
    
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
    
    def self.create(name)
        a = self.new(name).tap {|a| a.save}
    end
    
    def artists
        songs.map {|a| a.artist}.uniq
    end
end
