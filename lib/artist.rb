require 'pry'

class Artist
    extend Concerns::Findable

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def songs
        @songs
    end

    def self.create(name)
        artist = Artist.new(name)
        artist.save
        artist
    end

    def add_song(song)
        song.artist = self unless song.artist == self
        self.songs << song unless @songs.include?(song)
    end

    def genres
        self.songs.collect {|song| song.genre}.uniq
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def self.destroy_all
        self.all.clear
    end
end
