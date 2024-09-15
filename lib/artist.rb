require_relative 'concerns/findable'

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

    def save
        @@all << self
    end

    def self.destroy_all
        self.all.clear
    end

    def self.create(name)
        artist = Artist.new(name)
        artist.save
        artist
    end

    def add_song(song)
        song.artist = self unless song.artist
        self.songs << song unless self.songs.include?(song)
    end

    def genres
        genres_list = []
        self.songs.each do |song|
            genres_list << song.genre unless genres_list.include?(song.genre)
        end
        genres_list
    end

end
