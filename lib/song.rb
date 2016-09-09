class Song
    attr_accessor:name
    attr_reader:artist, :genre
    
    extend Concerns::Findable
    
    @@all = []
    
    def initialize(name, artist=nil, genre=nil)
        @name = name
        if artist != nil
            self.artist = artist
        end
        if genre != nil
            self.genre = genre
        end
    end
    
    def self.all
        @@all
    end
    
    def self.sort_by_artist
        self.all.sort{|x,y| x.artist.name <=> y.artist.name}
    end
    
    def self.destroy_all
        self.all.clear
    end
    
    def save
        self.class.all << self
    end
    
    def artist=(artist)
        @artist = artist
        @artist.add_song(self)
    end
    
    def genre=(genre)
        @genre = genre
        if !@genre.songs.include?(self)
            @genre.songs << self
        end
    end
    
    def self.new_from_filename(filename)
        data = filename.chomp(".mp3").split(" - ")
        new_song = self.new(data[1])
        new_song.artist = Artist.find_or_create_by_name(data[0])
        new_song.genre = Genre.find_or_create_by_name(data[2])
        new_song
    end
    
    def self.create_from_filename(filename)
        new_song = self.new_from_filename(filename)
        new_song.save
        new_song
    end
end