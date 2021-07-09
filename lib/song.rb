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

    # initializes a song based on the passed-in filename
    def self.new_from_filename(filename)
        parts = filename.split(" - ")
        artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")

        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        new(song_name, artist, genre)
    end

    # Does the same thing as .new_from_filename but also saves the newly-created song to the @@all class variable.
    def self.create_from_filename(filename)
        new_from_filename(filename).tap{ |s| s.save }
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
    
    # Assigns a genre to the song (song belongs to genre)
    # Adds the song to the genre's collection of songs.
    # Does not add the song to the genre's collection of songs if it already exists therein
    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

    # Finds a song instance in @@all by the nam property of the song
    def self.find_by_name(name)
        all.detect {|s| s.name == name}
    end 

    # Returns (does not recreate) an existing son with the provided name if one exists in @@all
     # Will create one if it doesn't exist
     def self.find_or_create_by_name(name)
       find_by_name(name)|| create(name)
    end
    
end
