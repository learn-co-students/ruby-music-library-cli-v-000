require 'pry'

class Song
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []
    
    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist if artist != nil
        self.genre = genre if genre != nil
    end
    
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end
    
    def genre=(genre)
        @genre = genre
        genre.songs << self if !genre.songs.include?(self)
    end
    
    def save
        self.class.all << self
    end
    
    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def self.create(name)
        song = self.new(name)
        song.save
        song
    end

    def self.new_from_filename(name)
        split = name.split(" - ")
        artist = Artist.find_or_create_by_name(split[0])
        genre = Genre.find_or_create_by_name(split[2].gsub(".mp3", ""))
        song = self.new(split[1], artist, genre)
        song
    end

    def self.create_from_filename(name)
        new_from_filename(name).tap{|s|s.save}
    end
end
