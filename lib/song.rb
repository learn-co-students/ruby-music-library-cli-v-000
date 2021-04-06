class Song
    
    attr_accessor :name
    attr_reader :artist, :genre
    extend Concerns::Findable
    extend Persistable::ClassMethods
    include Persistable::InstanceMethods
    
    def initialize(name, artist= nil, genre = nil)
        @name = name
        self.artist=(artist) if artist != nil
        self.genre=(genre) if genre != nil
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
    
    def self.create(song)
        new_song = Song.new(song)
        new_song.save
        new_song
    end
    
    def self.new_from_filename(filename)
        song_name = (filename.split(" - ")[1])
        artist_name = (filename.split(" - ")[0])
        genre_name = (filename.split(" - ")[2]).gsub(".mp3", "")
        
        artist= Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        self.new(song_name, artist, genre) unless self.find_by_name(song_name)
    end
    
    def self.create_from_filename(filename)
       song = self.new_from_filename(filename) 
       song.save
    end
    
end