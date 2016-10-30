class Artist
    attr_accessor :name, :songs

    include Concerns::Findable
    extend Concerns::ClassMods

    @@all = []

    def initialize(n)
        super
        @songs = []
    end

    def self.all
        @@all
    end

    def add_song(song)
        if !self.songs.include?(song)
            @songs << song
            song.artist=self
        end
    end

end
