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
  
  
  
end 