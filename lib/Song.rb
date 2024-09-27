class Song 

  extend Concerns::Findable 

  attr_accessor :name, :artist, :genre
  
  @@all = []


  def initialize(name, artist= nil, genre= nil)
    @name = name 
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil 
  end 

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self)
      nil
    else 
    genre.songs << self  
    end 
  end
 
  def genre
    @genre 
  end 

  def save
    @@all << self 
  end 

  def self.all
    @@all
  end 

  def self.destroy_all
    @@all.clear 
  end 

  def self.create(name)
    new_song = Song.new(name)
    @@all << new_song
    new_song 
  end 

 # def self.find_by_name(name) 
#    if self.all.detect { |artist| artist.name == name } 
 #      self.all.detect { |artist| artist.name == name } 
#    end 
#  end 
  
  #def self.find_or_create_by_name(name)
  #   if self.find_by_name(name) != nil 
  #     self.find_by_name(name)
  #  else
  #    self.create(name)
  #  end   
  #end 


def self.new_from_filename(file)
   song_info = file.chomp(".mp3").split(" - ")
    
    artist_name = song_info[0]
    artist = Artist.find_or_create_by_name(artist_name)
    genre_name = song_info[2]
    genre = Genre.find_or_create_by_name(genre_name)
    title = song_info[1]
    
    new_song = Song.new(title, artist, genre)
 
  end 

  def self.create_from_filename(file)
    @@all << self.new_from_filename(file) 
  end 
  

end #ends class 

