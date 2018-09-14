require 'pry'

class Genre
#Genres have many songs and are initialized with an empty list of songs.
    attr_accessor :name, :songs
 #Class variable stores all Genres instances via #SAVE.
    @@all = []

    # initialize and accepts a name for the new genre instance
    def initialize(name)
        @name = name
        @songs = []
        save #invoke #SAVE
    end    
    
    def self.all 
        @@all
    end

    # adds the Genre instance to the @@all class variable
    def save
        @@all << self
    end

    # initializes, saves, and returns the genre. 
    def self.create(name)
        genre = new(name)
        genre.save
        genre
    end

    #resets the @@all class variable to an empty array
    def self.destroy_all
        @@all.clear
    end

    # returns a collection of artists for all of the genre's songs (genre has many artists through songs)
    #   does not return duplicate artists if the genre has more than one song by a particular artist (genre has many artists through songs)
    #   collects artists through its songs instead of maintaining its own @artists instance variable (genre has many artists through songs)
    def artists
        songs.collect{ |song| song.artist }.uniq 
    end

end