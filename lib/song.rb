require 'pry'

class Song

    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist=(artist) if artist
        self.genre=(genre) if genre
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        self.new(name).tap {|song| song.save}
    end

    def self.find_by_name(name)
        @@all.detect {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        unless Song.all.any? {|song| song.name == name}
            Song.create(name)
        end
        Song.find_by_name(name)
    end

    def self.new_from_filename(filename)
        filename.to_s.slice!(".mp3")
        array = filename.split(" - ")
        artist = Artist.find_or_create_by_name(array[0])
        genre = Genre.find_or_create_by_name(array[2])
        self.new(array[1], artist, genre)
   #     binding.pry
    end

    def self.create_from_filename(filename)
        song = new_from_filename(filename).tap {|song| song.save}
   #     binding.pry
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self) unless artist == nil
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

end

