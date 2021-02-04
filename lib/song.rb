class Song 
    attr_accessor :name, :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist=(artist) if artist
        self.genre=(genre) if genre 

    end

    def self.all
        @@all
    end

    def save
        @@all << self 
    end

    def self.destroy_all
        all.clear
    end

    def self.create(name)
        new_song = self.new(name)
        new_song.save
        new_song

    end

    def artist=(artist1)
        if artist1.is_a? String
            new_artist = artist.new(artist1)
            @artist = new_artist
            new_artist.add_song(self)
        else
            @artist = artist1
            artist1.add_song(self)
        end
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end
    
        
    def self.find_by_name(name)
        self.all.each do |song|
            if song.name == name
                return song
            end
        end
        nil
    end

    def self.find_or_create_by_name(name)
        find_by_name(name) || create(name)
    end

    def self.new_from_filename(filename)
        name = filename.split(" - ")[1]
        artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
        genre = Genre.find_or_create_by_name(filename.split(" - ")[2].chomp(".mp3"))
        song = self.new(name, artist, genre)
    end

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
        song.save
    end

    




end
