class Genre

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
        self.new(name).tap do |genre|
            genre.save
        end
    end

    def artists
        self.songs.collect do |song|
            song.artist
        end.uniq
    end

    def to_s
        self.name
    end

end
