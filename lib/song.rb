class Song  
    extend Concerns::Findable

    @@all = []
    attr_accessor :name
    attr_reader :artist, :genre
    
    def initialize(name, artist = nil, genre = nil)
        @name = name
        if !artist.nil?
            self.artist = artist
        end
        if !genre.nil?
            self.genre = genre
        end
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)

    end

    def self.all
        @@all
    end

    def artist=(artist)
       
        @artist = artist  if self.artist.nil?
        # if !artist.songs.include?(self)
        #     artist.songs << self
        # end
        artist.add_song(self)

    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    # def self.find_by_name(name)
    #     self.all.detect{ |song|
    #         song.name == name
    #     }
    # end

    # def self.find_or_create_by_name(name)
    #     result = self.find_by_name(name)
    #     result.nil? ? self.create(name) : result 
    # end

    def self.create(name)
        # song = self.new(name)
        # song.save
        # song
        self.new(name).tap{ |song|
            song.save
        }
    end

    def self.new_from_filename(filename)
        filename.slice!(".mp3")
        collection = filename.split(" - ")

        song = self.find_or_create_by_name(collection[1])
        artist = Artist.find_or_create_by_name(collection[0])
        genre = Genre.find_or_create_by_name(collection[2])
        song.artist = artist
        song.genre = genre
        song
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename)
    end
end