require 'pry'

class Song

    attr_accessor :name, :song
    attr_reader :artist, :genre

    @@all = []
    
    def initialize(name, artist = nil, genre = nil)
        @name = name
        @artist = artist
        @genre = genre
        if artist
            self.artist=(artist)
        if genre
            self.genre=(genre)
        end
        end
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
        @artist = artist
        artist.add_song(self)   
    end

    def genre=(genre)
        @genre = genre
        if genre.songs.include?(self)
            genre.songs
        else
            genre.songs << self
        end
    end
end