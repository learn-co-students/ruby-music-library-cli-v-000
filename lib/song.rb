class Song
  
  attr_accessor :name, :songs
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
    
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
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
  
  def self.create(song_name)
   new_song = self.new(song_name)
  	new_song.save
    new_song
  end
  
  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end
   
  def self.find_or_create_by_name(song_name)
     if song = self.find_by_name(song_name)
       song
       
      else
        self.create(song_name)
      end
   end
   
   def self.new_from_filename(file_path)
     array = file_path.split(" - ")
     
     artist_name = array[0]
     song_name = array[1]
     genre_name = array[2].chomp(".mp3")
         
     artist = Artist.find_or_create_by_name(artist_name)
     genre = Genre.find_or_create_by_name(genre_name)
      Song.new(song_name, artist, genre) 
    end
    
    def self.create_from_filename(file_path)
      self.new_from_filename(file_path).save
    end
  end
        
  
        
 
 
       

  
 