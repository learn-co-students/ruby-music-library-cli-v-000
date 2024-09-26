class Song
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = "", genre ="")
    @name = name
    if artist != ""
      self.artist = artist
    end
    
    if genre != ""
      self.genre = genre
    end
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def artist
    @artist
  end
  
  def genre
    @genre
  end
  
  def self.create(name)
  song = self.new(name)
  song.save
  song
  end
  
  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    self.genre.add_song(self)
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end
  
  def self.new_from_filename(filename)
    name_1 = filename.split(" - ")[1]
    artist_1 = filename.split(" - ")[0]
    genre_1 = filename.split(" - ")[2].gsub(".mp3","")
    
    artist_2 = Artist.find_or_create_by_name(artist_1)
    genre_2 = Genre.find_or_create_by_name(genre_1)
    
    newsong = self.new(name_1,artist_2,genre_2)
    newsong
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
  
  
  
end