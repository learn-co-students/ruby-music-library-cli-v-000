class Artist
    
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

    def self.create(artist)      
        new_artist = Artist.new(artist)
        new_artist.save 
        new_artist
    end

    def add_song (song) 
        # song.artist = self unless song.artist 
        # songs << song unless songs.include? (song)  
        if song.artist 
            song.artist
        else
            song.artist = self
        end
        @songs.include?(song) ? song : @songs << song   
    end

    def genres
    songs.map(&:genre).uniq
    end

end