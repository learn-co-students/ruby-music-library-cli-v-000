class Song
    extend Concerns::Findable 
  
    attr_accessor :name, :artist, :genre
    
    @@all = []
  
    def initialize(name, artist = nil, genre = nil)
      @name = name
      self.artist = artist unless artist.nil?
      self.genre = genre unless genre.nil?
      @@all << self
    end

    def self.create(name)
      self.new(name)
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end
    
    def self.new_from_filename(filename)
        artist_name, song_name, genre_name = filename.chomp(".mp3").split(" - ")
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        song = Song.new(song_name, artist, genre)
        song
    end
    
    def self.create_from_filename(filename)
        new_from_filename(filename)
    end

    def save
      @@all << self
    end

    def artist=(artist)
      @artist = artist
      
      if !artist.songs.include?(self)
        artist.add_song(self)
      end
    end
    
    def genre=(genre)
      @genre = genre
      
      if !genre.songs.include?(self)
        @genre.songs << self
      end
    end
end