class Song
    attr_accessor :name, :genre
    attr_reader :artist

    @@all = []

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def initialize(name, artist=nil, genre=nil)
        @name = name
        if artist != nil
            self.artist = artist
        end
        if genre != nil
            self.genre = genre
        end
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

    def self.find_by_name(name)
        all.detect {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        if find_by_name(name)
            find_by_name(name)
        else
            create(name)
        end
    end

    def self.new_from_filename(f)
        parts = f.split(" - ")
        artist_name = parts[0]
        song_name = parts[1]
        genre_name = parts[2].gsub(".mp3", "")

        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)

        Song.new(song_name, artist, genre)
    end

    def self.create_from_filename(f)
        new_from_filename(f).tap {|s| s.save}
    end

end