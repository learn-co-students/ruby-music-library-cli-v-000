require 'pry'

class Song

    attr_accessor :name, :song
    attr_reader :artist

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

    def artist=(artist)
        artist = add_song(song)
    end
end