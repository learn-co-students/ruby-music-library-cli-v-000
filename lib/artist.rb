class Artist

    extend Concerns::Findable

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
        self.class.all << self
    end

    def self.create(name)
        self.new(name).tap do |artist|
            artist.save
        end
    end

    def add_song(song)
        song.artist = self unless song.artist == self
        @songs << song unless @songs.include?(song)
    end

    def genres
        self.songs.collect do |song|
            song.genre
        end.uniq
    end

    def to_s
        self.name
    end

end
