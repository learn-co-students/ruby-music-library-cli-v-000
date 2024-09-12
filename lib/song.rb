class Song 
  attr_accessor :name 
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil 
      self.genre=(genre)
    end
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self if !genre.songs.include?(self)
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
  
  def self.create(name)
    song = self.new(name)
    song.save
    return song
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end
  
  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    artist_object = Artist.find_or_create_by_name(artist)
    name = filename.split(" - ")[1]
    genre = filename.split(" - ")[2].gsub(".mp3", "")
    genre_object = Genre.find_or_create_by_name(genre)
    song = Song.new(name, artist_object, genre_object)
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
  
end