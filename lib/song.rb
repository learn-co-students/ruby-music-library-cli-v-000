class Song 
 
  @@all = []

  attr_accessor :name, :artist, :songs, :genre 
   
  def initialize(name, artist= nil, genre= nil)
    @name = name 
    @artist = artist 
    @genre = genre 

    if artist != nil 
      self.artist = artist 
    end 
     
    if genre != nil 
      self.genre = genre 
    end 
  end 

  def self.destroy_all 
     @@all.clear 
  end 

   def self.all
    @@all 
   end 

   def save
     @@all<<self
   end 

   def self.create(song_name)
      
      new_song = Song.new(song_name)
      new_song.save 
      new_song
   end 
  
   def artist=(artist)
   @artist = artist 
   artist.add_song(self)
   end 

   def genre=(genre)
   @genre = genre 
   
   if genre.songs.detect {|i| i.name == self.name} != self 
   genre.songs << self
   end 

   end 

   def self.find_by_name(name)
     @@all.detect{|song| song.name == name }

   end 

   def self.find_or_create_by_name(name)
        
     if @@all.detect{|song| song.name == name}  
        self.find_by_name(name)
      else 
         self.create(name)
      end 

   end 

def self.new_from_filename(file_name)
    file_name = file_name.split('-',3)
    
  

    new_song = Song.find_or_create_by_name(file_name[1].strip)
    
    new_song.artist = Artist.find_or_create_by_name(file_name[0].strip)
    
    new_song.genre = Genre.find_or_create_by_name(file_name[2].strip.split('.')[0])
    
    new_song

  end 

  def self.create_from_filename(file_name)
    

    new_int = self.new_from_filename(file_name)
     
     
    
    new_int

  end 



end 

