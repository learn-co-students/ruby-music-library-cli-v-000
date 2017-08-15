class Artist
    extend Concerns::Findable
    
    attr_accessor :name
    attr_reader :genres

    @@all = []

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def initialize(name)
        @name = name
        @songs = []
    end

    def songs
        @songs
    end

    def save
        @@all << self
    end

    def self.create(name)
        artist = Artist.new(name)
        artist.save
        artist
    end

    def add_song(song)
        if !song.artist
            song.artist = self
        end
        if !songs.include?(song)
            self.songs << song
        end
    end

    def genres
        song_genres = []
        songs.each do |song|
            song_genres << song.genre
        end
        song_genres.uniq
    end

end