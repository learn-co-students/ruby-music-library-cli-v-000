 class Song 
extend Concerns::Findable 
  attr_accessor :name, :genre 
  attr_reader  :artist
  
  @@all =[]
  
  def initialize(name, artist=nil, genre=nil)
    @name= name 
    
    if artist != nil 
      self.artist = artist
    end
    if genre != nil
      self.genre= genre 
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
    song = self.new(name)
    song.save
    song
  end
  
  
  def artist=(artist)
    @artist= artist 
    artist.add_song(self)
  end
  
 
  
  def genre=(genre)
    @genre= genre
     genre.songs << self unless genre.songs.include?(self)
  end
  
  
  def self.find_by_name(name)
    @@all.detect{|artist| artist.name == name}
  end
  
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
 
  
  def self.new_from_filename(name)
    song_name = name.split(" - ")[1]
    artist = name.split(" - ")[0]
    genre = name.split(" - ")[2].chomp(".mp3")
    song = self.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end
  
  def self.create_from_filename(name)
    @@all << self.new_from_filename(name)

  end
  
  
end