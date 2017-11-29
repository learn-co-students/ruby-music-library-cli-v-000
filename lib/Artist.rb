class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.create(name)
        instance = self.new(name)
        instance.save
        instance
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

    def songs
        @songs
    end

    def add_song(song)
        @songs << song if !@songs.include?(song)
        if !song.artist
            song.artist = self
        end
    end
end