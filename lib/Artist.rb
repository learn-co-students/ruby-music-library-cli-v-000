require 'pry'
require_relative './Song.rb'
require_relative './Genre.rb'

class Artist

    extend Concerns::Findable

    attr_accessor :name, :songs

    @@all = []

    #Constructors
    def initialize(name)
        @name = name
        @songs = []
    end
    
    def self.create(name)
        artist = Artist.new(name)
        artist.save
        artist
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

        if song.artist == false
            song.artist = self
        end

    end

    def genres
        genres = []
        @songs.each do |song|
            if genres.include?(song.genre) == false
                genres << song.genre
           end
        end
        genres
    end

end



