class Genre

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
        self.new(name).save.last
    end

    def songs
        @songs
    end
end

# def genres
#     self.songs.collect do |song|
#         song.genre
#     end
# end