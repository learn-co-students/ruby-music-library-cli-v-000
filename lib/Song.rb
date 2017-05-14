require 'pry'

class Song
    extend Concerns::Findable
    extend Persistable::ClassMethods
    include Persistable::InstanceMethods

    attr_accessor :name, :artist, :genre, :song_name

 
    @@all = []
 
    def initialize(name, artist = nil, genre = nil)
       @name = name
       self.artist = artist unless artist == nil
       self.genre = genre unless genre == nil
     
    end
    
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end
     def genre=(genre)
        @genre = genre 
        genre.songs.push(self) unless genre.songs.include?(self)
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end


    def self.create(song)
        c = self.new(song)
        c.save
        c
    end
    

    def self.destroy_all
        self.all.clear

    end
   

    # def self.find_by_name(name)
    #     self.all.detect {|s| s.name == name}
    # end

    

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)

    end

      def self.new_from_filename(file_name)
       title = file_name.split(" - ")[1]
      song = self.new(title)
      artist = file_name.split(" - ")[0]
      song.artist_name=(artist)
      genre = file_name.split(" - ")[2].gsub(".mp3","")
      song.genre_name=(genre)
      song.artist = Artist.find_or_create_by_name(artist)
      song
      
    end 

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        self.artist.add_song(self)
    end

    def genre_name=(name)
        self.genre = Genre.find_or_create_by_name(name)
    end

    def self.create_from_filename(file_name)
        song = self.new_from_filename(file_name)
        song.save
        song
        
    end
    

end