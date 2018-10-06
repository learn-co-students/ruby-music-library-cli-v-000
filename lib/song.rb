class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
    if artist.class == Artist
    artist.songs << self
    end
    if genre.class == Genre
      genre.songs << self
    end
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    song = self.new(name)
  end
  
  def save
    @@all << self
  end
  
  def artist=(artist)
    @artist = artist
    if artist.class == Artist
      artist.add_song(self)
    end
  end
  
  def genre=(genre)
    @genre = genre
    if genre.class == Genre && !genre.songs.include?(self)
    genre.songs << self
    end
  end
  
 def self.find_by_name(search)
   @@all.detect do |a| a.name == search end
 end
  
 def self.find_or_create_by_name(search)
     results = self.find_by_name(search)
     if results == nil
       results = self.create(search)
     end
     results
 end
 
  def self.new_from_filename(filename)
    name = filename.split(/\ - /)
    artist = Artist.find_or_create_by_name(name[0])
    name[2].slice! ".mp3"
    genre = Genre.find_or_create_by_name(name[2])
    song = self.new(name[1], artist, (genre))
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
  end
end