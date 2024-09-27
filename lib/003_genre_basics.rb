class Genre
    
    extend Concerns::Findable

    attr_accessor :name, :songs
 
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
        self.class.all << self
    end
        #we want to do self.class.all instead of self.all because we're in the instance scope
        #so self.all would refer to the instance self, not the class self.
        #or @@all but self.class.all is more abstract

    def self.create(genre)      
        new_genre = Genre.new(genre)
        new_genre.save 
        new_genre
    end

    def artists
        songs.map(&:artist).uniq
    end
    
end