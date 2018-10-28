class Song 

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

  
end 

