require 'pry'
class Artist
    extend Concerns::Findable

    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def save
        self.class.all << self
    end

    def add_song(song)
        if !self.songs.include?(song)
            self.songs << song
        end
        if !song.artist
            song.artist = self
        end
    end

    def genres
        self.songs.map{|song| song.genre}.uniq
    end

    def self.all
        @@all
    end

    def self.all=(array)
        @@all = array
    end


    def self.destroy_all
        self.all = []
    end

    def self.create(name)
        new_artist = self.new(name)
        new_artist.save
        new_artist
    end
end