class Song
    attr_accessor :name
    attr_reader :artist

    @@all = []

    def initialize(name, artist = nil)
        @name = name
        if artist 
            self.artist = artist
        end
    end

    def self.create(name)
        song = Song.new(name)
        song.save
        song
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

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end
end