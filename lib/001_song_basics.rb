class Song

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name 
        self.artist=(artist) if artist #if artist exists in the argument, invoke artist= 
        self.genre=(genre) if genre != nil #if artist exists in the argument, invoke artist=
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.all
        @@all 
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        self.class.all << self
        #we want to do self.class.all instead of self.all because we're in the instance scope
        #so self.all would refer to the instance self, not the class self.
        #or @@all but self.class.all is more abstract
    end

    def self.create(song)      
        new_song = Song.new(song)
        new_song.save 
        new_song
    end

    def self.find_by_name(song_name)
        all.find{ |song| song.name == song_name }
    end

    def self.find_or_create_by_name(song)
        find_by_name(song) || create(song)
    end

    def self.new_from_filename(song)
        artist, song, genre = song.split(" - ")
        genre = genre.gsub(".mp3", "")

        artist = Artist.find_or_create_by_name(artist)
        genre = Genre.find_or_create_by_name(genre)
        new(song, artist, genre)
        
    end

    def self.create_from_filename(song)
        new_from_filename(song).save
    end

end
