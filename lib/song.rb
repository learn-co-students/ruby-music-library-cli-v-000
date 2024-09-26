class Song 
extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil  
    self.genre = genre if genre != nil 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.all
    @@all
  end 
  
  def self.destroy_all 
    @@all = []
  end 
  
  def self.create(name)
    name = self.new(name)
    name.save
    name
  end 
  
  def artist_name
    self.artist.name
  end
 
  
  def artist=(artist)
    if artist == nil 
       @artist = artist
    elsif artist != nil 
      @artist = artist
      artist.add_song(self)
    end 
  end

  def genre=(genre)
    @genre = genre 
    genre.add_song(self)
  end 
  
  def self.name 
    @name 
  end 
  
 def self.new_from_filename(filename)

    artist_name, song_name, genre_name = filename.split(" - ")
    genre_name = genre_name.chomp(".mp3")
    song = self.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name) 
    song 
   
  
  end 

  def self.create_from_filename(filename)
   new_from_filename(filename).save
  end

  
end 