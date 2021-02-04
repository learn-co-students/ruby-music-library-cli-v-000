class Artist

    extend Concerns::Findable
    attr_accessor :name, :songs, :song, :genre
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        @@all = []
    end

    def self.create(name)
        new_song = self.new(name)
        new_song.save
        new_song

    end

    def add_song(song)
        unless song.artist == self
            song.artist = self 
        end
        unless @songs.include?(song)
            @songs << song
        end
    end

    def genres
        @genres = []
        @songs.each do |song|
            unless @genres.include?(song.genre)
                @genres << song.genre
            end
        end
        @genres
    end




end