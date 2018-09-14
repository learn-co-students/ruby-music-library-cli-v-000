require 'pry'

class Artist

    attr_accessor :name, :songs

    #Class variable stores all ARTIST instances via #SAVE. 
    @@all = []

    # Initializes and requires a 'name' ARGUMENT for the new artist instance created.
    def initialize(name)
        @name = name
        @songs = []
        save #invoke #SAVE
    end

     # Creates new ARTIST, saves it, and then returns that ARTIST. 
     def self.create(name)
        artist = new(name)
        artist.save
        artist
     end

     # Adds the Artist instance to the @@all ARTIST class variable
     def save
        @@all << self
    end

    # Returns all ARTISTS instances inside the ARTIST @@all variable.
    def self.all 
        @@all
    end

    # 1. Assigns current ARTIST to a song UNLESS that SONG already has an artist.
    #2. Adds that SONG to the ARTIST's @songs UNLESS it already has that SONG.
    def add_song(song)
        self.save unless self.class.all.include?(self)
        self.songs << song unless self.songs.include?(song)
        song.artist = self unless song.artist == self
    end
    
    #Returns a collection of genres for all of the artist's songs.
    #does not return duplicate genres if the artist has more than one song of a particular genre.
    #collects genres through its songs instead of maintaining its own @genres instance variable.   
    def genres
        songs.collect{ |s| s.genre }.uniq
      end

    #Removes all ARTIST instances saved in its @@all ARTIST var
    def self.destroy_all
        @@all.clear
    end
    # binding.pry
end