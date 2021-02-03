class Artist
    attr_accessor :name, :songs, :song
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        @@all = []
    end

    def self.create(name)
        new_song = self.new(name)
        new_song.save
        new_song

    end

    def add_song(song)
        unless song.artist == self
            song.artist = self 
            @songs << song
        end
    end



end