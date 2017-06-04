class Genre
    extend Concerns::Findable
     @@all = []
    attr_accessor :name, :songs
    
    def initialize(name)
        @name = name
        @songs = []
    end

    def artists
        collection = self.songs.collect{ |song|
            song.artist
        }
        collection.uniq
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
        self.new(name).tap{ |genre|
            genre.save
        }
    end
end