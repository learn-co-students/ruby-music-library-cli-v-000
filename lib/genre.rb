class Genre
    attr_accessor :name
    @@all = []

    extend Concerns::Findable

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

    def songs
        @songs
    end

    def artists
        @artists = []
        @songs.each do |song|
            unless @artists.include?(song.artist)
                @artists << song.artist
            end
        end
        @artists
    end
end