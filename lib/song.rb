require_relative 'concerns/findable.rb'

class Song
    extend Concerns::Findable

    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist=nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
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
        song = Song.new(name)
        song.save
        song
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)
    end

    def self.find_by_name(name)
        self.all.detect{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(file_name)
        song_info = file_name.gsub(".mp3","").split(" - ").collect{|i| i.strip}
        artist = song_info[0]
        song = song_info[1]
        genre = song_info[2]

        new_artist = Artist.find_or_create_by_name(artist)
        new_genre= Genre.find_or_create_by_name(genre)

        self.new(song, new_artist, new_genre)
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).save
    end

end
