require 'pry'

class Artist
    attr_accessor:name, :songs
    
    extend Concerns::Findable
    
    @@all = []
    
    def initialize(name)
        @name = name
        @songs = []
    end
    
    def self.all
        @@all
    end
        
    def self.destroy_all
        self.all.clear
    end
    
    def save
        self.class.all << self
    end
    
    def add_song(song)
        if !self.songs.include?(song)
            self.songs << song
        end
        if !song.artist
            song.artist = self
        end
    end
    
    def genres
        genres_array = []
        self.songs.each do |song|
            genres_array << song.genre
        end
        genres_array.uniq
    end
end