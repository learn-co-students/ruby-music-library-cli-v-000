require 'pry'
require_relative './Artist.rb'
require_relative './Genre.rb'

class Song

    attr_accessor :name, :artist, :genre

    @@all = []

    #Constructors
    def initialize(name, artist = false, genre = false)
        @name = name
        self.artist = artist
        self.genre = genre
    end
    
    def self.create(name)
        song = Song.new(name)
        song.save
        song
    end
    
    #Class Methods
    def self.all
        @@all
    end 
    
    def self.destroy_all
        @@all = []
    end
    
    def self.find_by_name(name)
        @@all.detect do |song|
            song.name == name
        end
    end
    
    def self.find_or_create_by_name(name)
        if self.find_by_name(name) == nil
            song = Song.create(name)
        else
            self.find_by_name(name)
        end
    end

    def self.new_from_filename(filename)
        artist_name = filename.split(/\s-\s|.mp3/)[0]
        song_name = filename.split(/\s-\s|.mp3/)[1]
        song_genre = filename.split(/\s-\s|.mp3/)[2]

        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(song_genre)

        song = self.new(song_name)
        song.artist = artist
        song.genre = genre

        song
    end

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
        song.save
    end

    #Instance Methods
    def save
        @@all << self
    end

    def artist=(artist)
        @artist = artist
        if artist != false
            artist.add_song(self)
        end
    end

    def genre=(genre)
        @genre = genre
        if genre != false
            genre.add_song(self)
        end
    end

end

#song = Song.new("xmas")
#binding.pry