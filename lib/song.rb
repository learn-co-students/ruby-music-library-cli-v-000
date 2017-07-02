require 'pry'

class Song
    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        @artist = artist
        artist.add_song(self) if artist
        @genre = genre
        genre.add_song(self) if genre
    end

    def self.create(name)
        song = Song.new(name)
        song.save
        song
    end

    def self.new_from_filename(filename)
        song_title = filename.split(" - ")[1]
        artist_name = filename.split(" - ")[0]
        genre_name = filename.split(" - ")[2].split(".")[0]
        song = Song.new(song_title)
        song.artist = Artist.find_or_create_by_name(artist_name)
        song.genre = Genre.find_or_create_by_name(genre_name)
        song
    end

    def self.create_from_filename(filename)
        #self.new_from_filename(filename).save
        song_title = filename.split(" - ")[1]
        artist_name = filename.split(" - ")[0]
        genre_name = filename.split(" - ")[2].split(".")[0]
        song = Song.create(song_title)
        song.artist = Artist.find_or_create_by_name(artist_name)
        song.genre = Genre.find_or_create_by_name(genre_name)
        song
    end

    def self.find_by_name(name)
        self.all.detect {|a| a.name == name}
    end

    def self.find_or_create_by_name(name)
        if self.find_by_name(name)
            self.find_by_name(name)
        else
            a = self.new(name)
            a.save
            a
        end
    end

    def artist=(artist)
        if artist.class == String
            @artist = Artist.find_or_create_by_name(artist)
        else
            @artist = artist
        end
        artist.add_song(self) unless artist.songs.include?(self)
    end

    def genre=(genre)
        if genre.class == String
            @genre = Genre.find_or_create_by_name(genre)
        else
            @genre = genre
        end
        genre.add_song(self) unless genre.songs.include?(self)
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def self.destroy_all
        self.all.clear
    end

end
