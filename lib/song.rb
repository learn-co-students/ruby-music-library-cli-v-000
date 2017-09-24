require "pry"
require_relative "concerns.rb"
class Song
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)     
        @name = name

        if artist
            self.artist= artist
        end

        if genre
            self.genre= genre
        end

        return self
    end

    def save
        self.class.all << self
    end

    def artist= (artist)
        if artist.class == String
            @artist = Artist.find_or_create_by_name(artist)
        else 
            @artist = artist
        end
        @artist.add_song(self) unless @artist.songs.include?(self)
    end

    def genre= (genre)
        if genre.class == String
            @genre = Genre.find_or_create_by_name(genre)
        else
            @genre = genre
        end
        @genre.add_song(self) unless @genre.songs.include?(self)
    end
        
    #CLASS METHODS

    
    def self.new_from_filename(filename)
        filename.chomp!(".mp3")
        artist = filename.split(' - ')[0]
        title = filename.split(' - ')[1]
        genre = filename.split(' - ')[2]
        song = self.new(title, artist, genre)
    end
    def self.create_from_filename(filename)
        new_song = self.new_from_filename(filename)
        new_song.save
        return new_song
    end
    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def self.create(name, artist = nil, genre = nil)
        song = self.new(name, artist, genre)
        song.save
        return song
    end
end