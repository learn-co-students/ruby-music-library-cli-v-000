class Song 
  
  attr_accessor :name, :artist , :genre
  @@all = []
  
  def initialize(song_name, song_artist = "", song_genre = "")
    @name = song_name 
    self.artist=(song_artist)
    self.genre=(song_genre)
  end 
  
  def name=(song_name)
    @name = song_name
  end 
  
  def name 
    @name 
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
    @@all << new_song 
    new_song
  end 
  
  
  def artist 
    @artist 
  end 
  
  def artist=(artist)
    @artist = artist
    if(artist != "")
      artist.add_song(self) if !artist.songs.include?(self)
    end 
    @artist
  end 
  
  def genre 
    @genre
  end 
  
  def genre=(genre)
    @genre = genre
    if(genre != "")
      genre.add_song(self) if !genre.songs.include?(self)
    end 
    @genre
  end 
  
  def self.find_by_name(song_name) 
    @@all.detect{|song_names| song_names.name == song_name}
  end 
  
  
  def self.find_or_create_by_name(song_name) 
    self.find_by_name(song_name) || self.create(song_name) 
  end 
  
  def self.new_from_filename(filename)
    arr1 = []
    arr2 = []
    arr1 = filename.split(" - ")
    artist_name_file = arr1[0]
    song_name = arr1[1]
    arr2 = arr1[2].split(".")
    genre_name = arr2[0]
 
    artist_instance = Artist.find_or_create_by_name(artist_name_file)
    genre_instance = Genre.find_or_create_by_name(genre_name)
    
    new_song = self.new(song_name, artist_instance, genre_instance)
    new_song
  end 
  

   def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    new_song.save
    new_song
   end 

  
  
end 