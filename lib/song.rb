class Song 
    attr_accessor :name, :artist
    @@all = []

    def initialize(name, artist = nil)
        @name = name
        self.artist=(artist)


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

    def artist=(artist)
        @artist = artist
        Artist.add_song(self)
    end

end
