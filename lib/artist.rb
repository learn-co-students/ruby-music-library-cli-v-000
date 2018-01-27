require_relative './concerns/findable.rb'

class Artist
    
    extend Concerns::Findable
    
    attr_accessor :name, :songs
    
    @@all = []
    
    def initialize(name)
        @name = name
        @songs = %w[]
    end
    
    def genres
        x = self.songs.collect {|x| x.genre}
        x.uniq
    end
    
    def self.all
        @@all
    end
    
    def save
        @@all << self
    end
    
    def self.create(name)
        new_artist = self.new(name)
        new_artist.save
        new_artist
    end
    
    def self.destroy_all
        @@all.clear
    end
    
    def add_song(song)
        song.artist = self if song.artist != self
        self.songs << song if !self.songs.include?(song)
    end
    
end