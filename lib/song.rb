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

    def self.find_or_create_by_name(name)
        find_by_name(name) || create(name)
    end

    def self.new_by_filename(filename)
        split_file_name_song = filename.split(" - ")[1] 
        name = filename.split(" - ")[0]    
        song = self.new(split_file_name_song)
        new_artist = Artist.find_or_create_by_name(name) 
        song.artist = new_artist
        new_artist.add_song(song)
        song
    end

end