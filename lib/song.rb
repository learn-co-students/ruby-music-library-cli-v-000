class Song
    extend Concerns::Findable

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        artist.add_song(self) if artist
        genre.add_song(self) if genre
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        song = Song.new(name)
        song.save
        song
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)
    end

    def self.new_from_filename(filename)
        parts = filename.split(" - ")
        artist_name = parts[0]
        title = parts[1]
        genre_name = parts[2].gsub(".mp3", "")
        song = Song.new(title)
        song.artist = Artist.find_or_create_by_name(artist_name)
        song.genre = Genre.find_or_create_by_name(genre_name)
        song
    end

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
        song.save
        song
    end

    # def self.find_by_name(name)
    #     @@all.find { |song| song.name == name }
    # end

    # def self.find_or_create_by_name(name)
    #     self.find_by_name(name) || self.create(name)
    # end

end