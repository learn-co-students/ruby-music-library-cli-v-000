class Artist

    attr_accessor :name, :artist
    attr_reader :songs, :genres

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

    def add_song(song)
        if song.artist
            song
        else 
            song.artist = self
            @songs << song
        end 
    end

    # def artist=(artist)
    #     @artist = artist
    #     add_song(self)
    # end

end