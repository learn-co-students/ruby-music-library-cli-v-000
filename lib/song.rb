#spec 009

class Song 

  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def self.new_from_filename(file_name)
  
    array = file_name.gsub(".mp3","").split(" - ")
    
    new_artist = Artist.find_or_create_by_name(array[0])
    new_song = self.find_or_create_by_name(array[1])
    new_song.artist = new_artist
    new_song
  
  end
    
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def self.find_by_name(name)
    self.all.detect{|a| a.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end 
  end 
    
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    @@all = []
  end 
  
  def save
    @@all << self
  end 
  
  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end 
  
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end 
    
    if genre !=nil
      self.genre=(genre)
    end 
    
  end 
  
  def genre=(genre)
    @genre = genre
    if genre.songs.detect{|a| a == self} == nil
      genre.songs << self
    end
    if genre.songs.detect{|a| a = self} == nil
      genre.songs << self
    end
  end
  
end 