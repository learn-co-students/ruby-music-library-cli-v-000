class Song 
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil )
    @name = name 
    if artist != nil 
      self.artist=(artist)
    else []
    end
    if genre != nil
      self.genre=(genre)
    else []
    end
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
  
  def save 
    @@all << self 
  end 
  
  def self.destroy_all
    @@all.clear 
  end 
  
  def self.create(name) 
    song = Song.new(name)
    song.save
    song
  end
  
  
  def self.new_from_filename(filename)
    song_file = filename.gsub(".mp3","").split(" - ")
    new_song = self.find_or_create_by_name(song_file[1])
    new_song.artist = Artist.find_or_create_by_name(song_file[0])
    new_song.genre = Genre.find_or_create_by_name(song_file[2])
    new_song
  end 
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end 