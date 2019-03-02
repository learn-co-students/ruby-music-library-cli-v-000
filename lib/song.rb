class Song
  attr_accessor :name
  @@all = []
  
  def initialize(name, artist = [], genre = [])
    @name = name
    if artist != [] && artist != nil 
      self.artist=(artist)
    end
    if genre != [] && genre != nil 
      self.genre=(genre)
    end 
  end
  
   def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end
  
  def artist 
    @artist 
  end
  
   def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end
  
  def genre 
    @genre 
  end 
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
    return self 
  end
  
  def self.create(name)
    new_song = Song.new(name)
    @@all << new_song
    new_song
  end
  
  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name 
    end 
  end
  
  def self.find_or_create_by_name(name)
    existing_song = nil 
    existing_song = find_by_name(name)
    if existing_song == nil 
      create(name)
    else
      return existing_song 
    end 
  end
  
  def self.new_from_filename(some_filename)
    some_filename_array = some_filename.split(" - ")
    new_song = self.new(some_filename_array[1])
    new_song.artist = Artist.find_or_create_by_name(some_filename_array[0])
    genre_mp3 = some_filename_array[2].split(".")
    new_song.genre = Genre.find_or_create_by_name(genre_mp3[0])
    return new_song
  end
  
  def self.create_from_filename(some_filename)
    new_song = self.new_from_filename(some_filename).save
    return new_song
  end 
  
end 