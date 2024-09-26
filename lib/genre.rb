class Genre
    extend Concerns::Findable
    
    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
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
        genre = Genre.new(name)
        genre.save
        genre
    end

    def add_song(song)
        if !song.genre
            song.genre = self
        end
        if !songs.include?(song)
            self.songs << song
        end
    end

    def artists
        song_artists = []
        songs.each do |song|
            song_artists << song.artist
        end
        song_artists.uniq
    end

end