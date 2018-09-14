require 'pry'

class Song

    attr_accessor :name, :artist, :genre
  
    #Class variable stores all SONG instances via #SAVE.
    @@all = []

    #Will store all created genres instances.
    @genres = []

    # Accepts 'optional' arguments for artist and genres objects.
    def initialize(name, artist = nil, genre = nil)
        @name = name
        save #invoke #SAVE
        #We need to specify 'unless' here because optional arguments are set to 'nil'
        self.artist = artist unless artist == nil
        self.genre = genre unless genre == nil
    end

    # Creates new SONG, saves it, and then returns that SONG. 
    def self.create(name)
        song = new(name)
        song.save
        song
    end

     # Adds the SONG instance to the @@all SONG Class variable
    def save
        @@all << self
    end

    # Returns all SONG instances inside the @@all SONG class variable.
    def self.all 
        @@all
    end

    # Removes all SONG instances saved in its @@all SONG class variable.
    def self.destroy_all
        @@all.clear
    end
  
    # Assigns an ARTIST to a SONG
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
      end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.find_by_name(name)
        all.detect {|s| s.name == name}
    end

    def self.find_or_create_by_name(name)
       find_by_name(name)|| create(name)
      end
end
