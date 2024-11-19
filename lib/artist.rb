class Artist
    attr_reader :name
    attr_writer :name
    attr_accessor :songs
    @@all = []

    extend Concerns::Findable

    def initialize(name)
       @name = name
       @songs = []
    end

    def save
       @@all.push(self)
    end

    def add_song(song)
       song.artist = self unless song.artist
       songs.push(song) unless songs.include?(song)
    end

    def genres
       songs.collect(&:genre).uniq
    end

    def self.create(name)
       Artist.new(name).tap(&:save)
    end

    def self.all
       @@all
    end

    def self.destroy_all
       @@all.clear
    end
 end
