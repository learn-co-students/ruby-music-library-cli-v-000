class Artist
    attr_accessor :name, :songs
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
        artist = self.new(name)
        artist.save
        artist
    end

    def add_song(song)
        song.artist ||= self
        @songs << song if @songs.include?(song) == false
    end

    def artist
        @songs.collect do |song|
            song.artist.uniq
        end
    end


end
