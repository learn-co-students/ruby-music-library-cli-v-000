class Song

    attr_accessor :name, :songs

    @@all = []

    def initialize(name, artist = nil)
        @name = name
        @songs = []
        if artist != nil
            self.artist(artist)
        end
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
        song = self.new(name) # This might be a issue "self" or "Class"
        song.save
        song
    end

    def artist=(artist)
         @artist = artist
         @artist.add_song(self)
    end

    def artist
        @artist
    end

end
