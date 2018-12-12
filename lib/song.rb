class Song
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    all.clear
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find {|ex| ex.name == name}
  end
  
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def initialize(name, artist= nil, genre= nil)
    @name= name
    
    if artist != nil
    self.artist = artist 
    end
    
    if genre != nil
    self.genre = genre
    end
  end
  
  def save
    @@all << self
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre= genre
    if genre.songs.include?(self)
    else
    genre.songs << self
    end
  end
  
  def self.new_from_filename(name)
    
    #parse
    
    song_name = name.split(" - ")[1]
    artist_name = name.split(" - ")[0]
    genre_name = name.split(" - ")[2].chomp(".mp3")
    
    #organize
    
    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre =  Genre.find_or_create_by_name(genre_name)
    song
  end
  
  def self.create_from_filename(name)
    @@all << self.new_from_filename(name)
  end
  
  
  
  
  
  
  
  
  
end