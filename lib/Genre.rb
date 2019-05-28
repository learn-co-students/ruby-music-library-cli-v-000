require_relative './Song.rb'
require_relative './Artist.rb'

class Genre

    extend Concerns::Findable

    attr_accessor :name, :songs

    @@all = []

    #Constructors
    def initialize(name)
        @name = name
        @songs = []
    end
    
    def self.create(name)
        genre = Genre.new(name)
        genre.save
        genre
    end

    #Class Methods
    def self.all
        @@all
    end 

    def self.destroy_all
        @@all = []
    end

    #Instance Methods
    def save
        @@all << self
    end

    def add_song(song)

        if @songs.include?(song) == false
            @songs << song
        end 

        if song.genre == false
            song.genre = self
        end
        
    end

    def artists
        artists = []
        @songs.each do |song|
            if artists.include?(song.artist) == false
                artists << song.artist
            end
        end
        artists
    end

end