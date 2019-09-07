require 'pry'

class Song
    
    attr_accessor :name
    attr_reader :artist, :genre
    
    @@all = []
    
    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist != nil
        self.genre = genre if genre != nil
    end
    
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end
    
    def genre=(genre)
        @genre = genre
        genre.songs << self if !genre.songs.include?(self)
    end
          
    def self.all
        @@all
    end
    
    def save
        @@all << self
    end
    
    def self.create(name)
        new_song = self.new(name)
        new_song.save
        new_song
    end
    
    def self.destroy_all
        @@all.clear
    end
    
    def self.find_by_name(name)
        self.all.find {|x| x.name == name}
    end
    
    def self.find_or_create_by_name(name)
        if self.find_by_name(name) == nil
            self.create(name)
        else
            self.find_by_name(name)
        end
    end
    
    def self.new_from_filename(name)
        rows = name.split(/-(?=\s)|[.]/)
        song_name = rows[1].strip
        artist = rows[0].strip
        genre = rows[2].strip
       
        x = self.find_or_create_by_name(song_name)
        y = Artist.find_or_create_by_name(artist)
        z = Genre.find_or_create_by_name(genre)
        x.artist = y
        x.genre = z
        x
    end
    
    def self.create_from_filename(name)
        self.new_from_filename(name)
    end
    
end

