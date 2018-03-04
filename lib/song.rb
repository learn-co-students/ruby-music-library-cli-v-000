require 'pry'

class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name, artist = nil)
        @name = name
        @artist = artist

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
        song = self.new(name) # Keep an eye on this one "self"
        song.save
        song
    end
end
