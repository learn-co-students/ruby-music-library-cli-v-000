require 'pry'

class Song

    attr_accessor :name

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        if artist != nil
            self.artist=(artist)
        end
        if genre != nil
            self.genre=(genre)
        end
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def artist=(artist)
         @artist = artist
         @artist.add_song(self)
         #binding.pry
    end

    def artist
        @artist
    end

    def genre=(genre)
         @genre = genre
         @genre.add_song(self)
         #binding.pry
    end

    def genre
        @genre
    end

    def self.create(name)
        song = self.new(name) # This might be a issue "self" or "Class"
        song.save
        song
    end

    def self.find_by_name(name_of_song)
        self.all.find do |s|
          s.name == name_of_song
        end
    end

    def self.find_or_create_by_name(name)
         self.find_by_name(name) || self.create(name)
    end

end
