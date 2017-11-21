require 'pry'

class Song

    attr_accessor :name, :song
    attr_reader :artist, :genre

    @@all = []
    
    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist=(artist) if artist
        self.genre=(genre) if genre
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

    def artist=(artist)
        @artist = artist
        artist.add_song(self)   
    end

    def genre=(genre)
        @genre = genre
        if genre.songs.include?(self)
            genre.songs
        else
            genre.songs << self
        end
    end

    def self.find_by_name(name)
        @@all.find { |song| song.name == name }
    end

    # def find_or_create_by_name
    #     def self.find_or_create_by_name(name)
    #         if artist = @@all.find {|artist| artist.name == name}
    #             artist
    # end

end