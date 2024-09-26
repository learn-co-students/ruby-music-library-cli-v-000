require 'pry'
class Artist
    extend Concerns::Findable

    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
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
        artist = self.new(name)
        artist.save
        artist
    end
    # "assigns the current artist to the song's 'artist' property (song belongs to artist)"
    # "does not assign the artist if the song already has an artist"
    # "adds the song to the current artist's 'songs' collection"
    # "does not add the song to the current artist's collection of songs if it already exists therein"
    def add_song(song)
        if !@songs.include?(song) && !song.artist
            @songs << song
            song.artist = self
        end
        # binding.pry
    end

    def genres
        Song.all.map {|song| song.genre}.uniq
    end


end
