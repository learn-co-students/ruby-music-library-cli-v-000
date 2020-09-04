require 'pry'
class Song
  
    attr_accessor :name, :artist, :genre
    # attr_reader 
     @@all = []
    
    # ----------------------------------------- 
    
    def initialize(name, artist = nil, genre = nil)
          @name = name
          
          # @artist = artist
          self.artist=(artist) unless !artist 
          
          # @genre = genre
          self.genre=(genre) if genre != nil
          # @@all = [] Never initialize with a class varaible
    end
    
    # -----------------------------------------
    
    def self.all
          @@all
    end
    
      # -----------------------------------------
    
    def self.destroy_all
          @@all.clear
    end
    
      # -----------------------------------------
    
    def save
          @@all << self
    end
    
      # -----------------------------------------
    
    def self.create(name)
          song = self.new(name)
          song.save
          song
    end

  # -----------------------------------------
  
  # def add_song(song)
  #     song.artist = self if song.artist != self 
  #     songs << song if !songs.include?(song)
  #   end
    
   # -----------------------------------------
   
    
    # So if add_song is an instance method and has 
    # to be called on an instance of the class and 
    # artist_name is actually going to be an instance 
    # how can we use those together in the artist= method?
    
    
    def artist=(artist)
          @artist = artist
          @artist.add_song(self)
    end
   
    # ----------------------------------------- 
    
    def genre=(genre)
          @genre= genre
          genre.songs << self if !genre.songs.include?(self)
    end
    
    # -----------------------------------------
    
    def self.find_by_name(name)
          # @@all.find {|song| song.name == name} Both are correct
          self.all.find {|song| song.name == name} # This is one is more abstract
    end
    
    # -----------------------------------------
    
    def self.find_or_create_by_name(name)
          song = self.find_by_name(name)
          return song if song 
          song = self.create(name)
    end
    
    # -----------------------------------------
    
    def self.new_from_filename(file)
        
      song_name = file.split(" - ")[1]
      
      #artist = file.split(" - ")[2]
      artist = Artist.find_or_create_by_name(file.split(" - ")[0])
      
      # genre = file.split(" - ")[2].chomp(".mp3")
      genre = Genre.find_or_create_by_name(file.split(" - ")[2].chomp(".mp3"))
      
      song = Song.new(song_name, artist, genre)
    
    end
      
    
    def self.create_from_filename(file)
      song = self.new_from_filename(file)
      song.save
    end 
    
    # -----------------------------------------
end  