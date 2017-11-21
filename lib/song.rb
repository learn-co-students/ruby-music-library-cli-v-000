require 'pry'

class Song

    attr_accessor :name, :song, :artist

    @@all = []
    
    def initialize(name, artist = nil)
        @name = name
        @artist = artist
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

    def artist=()
        add_song(song)

    end

    # def add_song(song)
    #     @songs << song
    #     song.artist = self
    # end
end