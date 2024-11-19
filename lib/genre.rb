require_relative './concerns/findable.rb'

class Genre
    
    extend Concerns::Findable
    
    attr_accessor :name, :songs
    
    @@all = []
    
    def initialize(name)
        @name = name
        @songs = %w[]
    end
    
    def self.all
        @@all
    end
    
    def save
        @@all << self
    end
    
    def self.create(name)
        new_genre = self.new(name)
        new_genre.save
        new_genre
    end
    
    def self.destroy_all
        @@all.clear
    end
    
    def artists
        x = self.songs.collect {|x| x.artist}
        x.uniq
    end
    
end