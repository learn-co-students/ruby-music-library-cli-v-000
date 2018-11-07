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
     song = self.new(file_path)
     self.add_song(song)
     song.name = file_path.split(" - ")[0].chomp(".mp3")
     song.artist = file_path.split(" - ")[1].chomp(".mp3")
     song.genre = file_path.split(" - ")[2].chomp(".mp3")
     
         
       
        
  
        
  #   def self.new_from_filename(name)
  #   song = self.new 
  #   song.name = (name.split(" - ")[1].chomp(".mp3"))
  #   song.artist_name = (name.split(" - ")[0])
  #   song
  # end
       
  end
  
  def import
    files.each { |file| file = Song.new_by_filename}
  end
  
end
 