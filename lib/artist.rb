require 'pry'

class Artist

    extend Concerns::Findable

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        self.save
    end

    def save
        @@all << self unless Artist.all.include?(self)
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        self.new(name).tap {|artist| artist.save}
    end

    def add_song(song)
        self.songs << song unless self.songs.include?(song)
        song.artist = self unless song.artist == self
    end

    def songs
        @songs
    end

    def genres
        songs.collect {|song| song.genre}.uniq
    end

end