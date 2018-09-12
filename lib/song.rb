class Song
 extend Concerns::Findable
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil 
      self.genre = genre 
    end
  end 
  
  def self.all 
    @@all.uniq
  end 
  
  def save 
    @@all << self unless @@all.include?(self)
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
  
  def self.create(name, artist = nil, genre = nil) 
    song = Song.new(name, artist, genre)
    song.save
    song
  end 
  
  def artist=(name)
    @artist = name
    @artist.add_song(self) 
  end 
  
  def genre=(name)
    @genre = name
    @genre.songs << self unless @genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end
    
  def find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else 
      self.find_by_name(name)
    end 
  end 
  
  def self.new_from_filename(song)
    song_parts = song.split(" - ")
    song_name = song_parts[1]
    artist = Artist.find_or_create_by_name(song_parts[0])
    genre = Genre.find_or_create_by_name(song_parts[2].split('.')[0])
    self.create(song_name, artist, genre)  
  end
  
  def self.create_from_filename(song)
    self.new_from_filename(song)
  end
      
end 