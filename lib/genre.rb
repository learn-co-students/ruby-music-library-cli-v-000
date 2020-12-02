class Genre
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
        if !song.genre
            song.genre = self
        end
    end

    def artists
        self.songs.map{|song| song.artist}.uniq
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
        new_genre = self.new(name)
        new_genre.save
        new_genre
    end
end