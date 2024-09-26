class Song

extend Concerns::Findable

  attr_accessor :name, :genre
  @@all = []
    def initialize(name, artist = nil, genre = nil)
      @name = name
      @artist = artist
      self.artist = artist if artist 
      self.genre = genre if genre   
      unless artist == nil
        artist.add_song(self)
      end
      unless genre == nil  
        genre.songs << self
      end  
    end
    def artist=(artist)
      @artist = artist
      unless artist.songs.include?(self)
        artist.add_song(self)
      end   
    end
    def genre=(genre)
      @genre = genre
      unless genre.songs.include?(self)
        genre.songs << self
      end  
    end
    def artist 
      @artist 
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

    def self.new_from_filename(song_delimiter)
      song_name = song_delimiter.split(" - ")[1] 
      artist_name = song_delimiter.split(" - ")[0]
      genre_name = song_delimiter.gsub(".mp3", "").split(" - ")[2] 
      artist = Artist.find_or_create_by_name(artist_name)
      genre = Genre.find_or_create_by_name(genre_name)
      song = Song.new(song_name, artist, genre)    
    end

    # Why can't you put song.name into this method? And why is Song.new OK but the others
    # aren't ?

    #Is this foundational logic in object relations or is it just one aspect of it?

    def self.create_from_filename(song_delimiter)
      song_name = song_delimiter.split(" - ")[1] 
      artist_name = song_delimiter.split(" - ")[0]
      genre_name = song_delimiter.gsub(".mp3", "").split(" - ")[2] 
      artist = Artist.find_or_create_by_name(artist_name)
      genre = Genre.find_or_create_by_name(genre_name)
      song = Song.new(song_name, artist, genre) 
      @@all << song
      song  
    end 

    def self.create(name)
      song = Song.new(name)
      @@all << song  
      song
    end

    # def self.find_by_name(name) 
    #   @@all.detect{|a| a.name == name}
    # end
    # def self.find_or_create_by_name(name)
    #   self.find_by_name(name) || self.create(name)
    # end 

    # WHY DOESN'T THIS FOLLOWING PART WORK FOR THE
    # METHOD WORK?? The object properties are different, but why?

    #   if self.find_by_name(name)
    #     self.find_by_name(name)
    #   else  
    #      song = self.new(name)
    #       @@all << song  
    #       song
    #   end 
    # end
    # end 
end  