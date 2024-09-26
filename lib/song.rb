require 'pry'
class Song
    # extend Concerns::Findable
    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
        @@all << self
    end

    def artist= (artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self if !genre.songs.include?(self)
    end

    def self.all
        @@all.uniq
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        song = self.new(name)
        song.save
        song
    end
    #
    def self.find_by_name(name)
        self.all.find {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        find_by_name(name) ? find_by_name(name) : create(name)
    end

    def self.new_from_filename(file)
        # binding.pry
        song = self.new(file.split(/\ - |.mp3/)[1])
        song.artist = Artist.find_or_create_by_name(file.split(/\ - |.mp3/)[0])
        song.genre = Genre.find_or_create_by_name(file.split(/\ - |.mp3/)[2])
        song
    end

    def self.create_from_filename(file)
        song = new_from_filename(file)
        song.save
        song
    end
end
