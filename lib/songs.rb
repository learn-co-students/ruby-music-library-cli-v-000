class Song
   attr_accessor :name
   attr_reader :artist, :genre
   
   @@all=[] #all song instances
   
   def initialize (name, artist = nil, genre= nil)
        @name=name
     
        if artist != nil
         self.artist=artist
        end
    
        if genre !=nil
         self.genre=genre
        end
   end
   
   def self.all #makes self aware
       @@all
   end
   
   def save  #saves the song instances in the @@all array
       @@all << self
   end
   
   def self.destroy_all #deystroys the @@all array
       @@all.clear
   end
   
   def self.create (name)
     new_song=Song.new(name)
     new_song.save  #creates a new song instance, saves it and returns the new song instance
     new_song
   end
   
   def artist=(artist) #adds the song to the artists' list of songs
       @artist=artist 
        artist.add_song(self)
  end
   
   def genre=(genre) #adds the song to the genre's list of songs
       @genre=genre
        if !genre.songs.include?(self)
         genre.songs << self
        end
    end
    
    def self.find_by_name (name_of_song) #iterates through the @@all comparing with the inputed name
        @@all.each do |song|
        if name_of_song==song.name
        return song
        end
                    end
    end
    
    def self.find_or_create_by_name(name_of_song) #iterates through looking for filename, and if not found, then a new song instance is created
        @@all.each do |song|
        if name_of_song==song.name
            return song 
        end
                    end
        self.create(name_of_song)
    end
    
    def self.new_from_filename(filename) #self is song class
      name=filename.gsub(".mp3","").split(" - ") #deletes.mp3 and splits name into three parts
      new_song=Song.new(name[1]) #creates a new song instance
      new_song.artist=Artist.find_or_create_by_name(name[0]) #used the findable to put the song into the artist list or to create a new artist
      new_song.genre=Genre.find_or_create_by_name(name[2]) #either puts the song in the genre's list or creates a new genre
      new_song #returns the new song
    end
    
    def self.create_from_filename(filename) #same from above,but saves the new song instance int he @@all of Song
      name=filename.gsub(".mp3","").split(" - ")
      new_song=Song.create(name[1])
      new_song.artist=Artist.find_or_create_by_name(name[0])
      new_song.genre=Genre.find_or_create_by_name(name[2])
      new_song
    end
    
    def fullname
       "#{self.artist.name} - #{self.name} - #{self.genre.name}" 
    end
       
    
end