require 'pry'

class Song
    attr_accessor :name
    attr_reader :artist, :genre
    
    @@all = []
    
    
    
    def initialize(name, song_artist = nil, song_genre = nil)
        @name = name
        if song_artist
            self.artist= song_artist
        end
        
        if song_genre
            self.genre = song_genre
        end
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
        created = self.new(name).tap {|a| a.save}
    end
    
    def artist=(artist)
        @artist = artist
        if !artist.songs.include?(self)
            artist.add_song(self)
        end
    end
    
    def self.new_from_filename(filename)
        parsed_name = filename.split('.')[0].split(' - ')
        new_song_name = parsed_name[1]
        new_song_artist = Artist.find_or_create_by_name(parsed_name[0])
        new_song_genre = Genre.find_or_create_by_name(parsed_name[2])
        self.new(new_song_name, new_song_artist, new_song_genre)
    end
    
    def self.create_from_filename(filename)
        self.new_from_filename(filename).tap {|a| a.save}
    end
    
    def genre=(genre)
        @genre = genre
        if !genre.songs.include?(self)
            genre.songs << self
        end
    end
    
    def self.find_by_name(name)
        self.all.detect {|a| a.name == name}
    end
    
    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end
    
end
