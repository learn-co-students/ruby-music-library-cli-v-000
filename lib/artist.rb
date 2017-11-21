class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        self.new(name).save.last
    end

    def songs
        @songs
    end

    def add_song(song)
        if song.artist
            song
        else 
            song.artist = self
            @songs << song
        end 
    end

end