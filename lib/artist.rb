require 'pry'
require_relative 'concerns.rb'
class Artist
    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all = []
    
    def initialize(name)        
        @name = name
        @songs = []
        self
    end
    
    def save
        self.class.all << self
    end
    
    def add_song(song)        
        if song.class == Song
            @songs << song unless @songs.include?(song)
            song.artist = self unless song.artist == self
        end
    end
    
    def genres
        g = []
        @songs.each do |song|
            if !g.include?(song.genre)
                g << song.genre
            end
        end
        return g
    end
    
    
    
    # CLASS METHODS
    def self.all
        @@all
    end
    
    def self.destroy_all
        self.all.clear
    end
    
    def self.create(name)
        artist = self.new(name)
        artist.save
        return artist
    end
end