class Song
    
    
        attr_accessor :name, :artist, :genre
    
    @@all = []
    
    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end 
    
    def artist=(artist)
        @artist = artist
        artist.add_song(self) unless artist.songs.include?(self)
    end
    
    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
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
        self.new(name).tap {|a| a.save}
    end
    
    def self.find_by_name(name)
        self.all.detect {|song| song.name == name}
    end
    
    def self.find_or_create_by_name(name)
        if self.find_by_name(name) == nil
            self.create(name)
        else
            self.find_by_name(name)
        end
    end 
    
    def self.new_from_filename(file_name)


        file = file_name.split(" - ")
        artist_name = file[0]
        artist = Artist.find_or_create_by_name(artist_name)
        genre_name = file[2].split(".")[0]
        genre = Genre.find_or_create_by_name(genre_name)
        name = file[1]
        song = self.new(name, artist, genre)
  end

  def self.create_from_filename(file_name)
        song = self.new_from_filename(file_name)
        @@all << song
  end
        
        
    
    
end
