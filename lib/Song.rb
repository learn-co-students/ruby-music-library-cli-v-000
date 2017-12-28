class Song
    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end

    def self.new_from_filename(filename)
        metadata = filename.split(" - ")
        song_name = metadata[1]
        artist_name = metadata[0]
        genre_name = (metadata[2].split("."))[0]
        self.new(
            song_name,
            Artist.find_or_create_by_name(artist_name),
            Genre.find_or_create_by_name(genre_name)
        )
    end

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
        song.save
        song
    end

    def self.create(name)
        song = Song.new(name)
        song.save
        song
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def self.find_by_name(name)
        self.all.detect {|song| name == song.name}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end

    def save
        @@all << self
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)
    end
end