class Song 
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre 
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil 
  end
  
  def self.all 
    @@all 
  end 
  
  def save 
    self.class.all << self 
  end
  
  def self.destroy_all 
   self.all.clear
  end
  
  def self.create(name, artist=nil, genre=nil)
    self.new(name, artist, genre).tap{|i| i.save}
  end
  
  def artist=(artist)
    @artist = artist
    artist.songs.include?(self) || artist.add_song(self)
  end
   
  def genre=(genre)
    @genre = genre
    genre.songs.include?(self) || genre.add_song(self)
  end

  
  def self.new_from_filename(basename) 
    data = basename.split(" - ")
    artist_name, song_name, genre_name = data[0], data[1], data[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
  end
  
  def self.create_from_filename(basename) 
    self.new_from_filename(basename)
  end
  
end
  