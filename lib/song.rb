require 'pry'

class Song

    extend Concerns::Findable

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []
    
    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist=(artist) if artist
        self.genre=(genre) if genre
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        self.new(name).save.last
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)   
    end

    def genre=(genre)
        @genre = genre
        if genre.songs.include?(self)
            genre.songs
        else
            genre.songs << self
        end
    end

    def self.new_from_filename(file)
        split_artist, split_song, split_genre = file.split(" - ") 
        split_genre_chomp = split_genre.chomp(".mp3")
        song = self.new(split_song)
        artist = Artist.find_or_create_by_name(split_artist)
       artist.add_song(song)
        genre = Genre.find_or_create_by_name(split_genre_chomp)
        song.genre=(genre)
        # song.artist=(artist)
        song

        
        # binding.pry
    end

    def self.create_from_filename(file)
        song = self.new_from_filename(file)
        song.save
    end

    def self.sort_by_name
        @@all.sort { |a,b| a.name.downcase <=> b.name.downcase }
    end

# sort the data by the last_name field

end
