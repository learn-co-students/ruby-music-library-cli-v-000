# don't forget to 'extend' modules

class Song
  attr_accessor :name, :artist, :genre
  
  @@all = []

  def self.all
    @@all
  end
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist=artist
    end
    if genre != nil
      self.genre=genre
    end
    self.save
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    Song.new(name).save
    self
  end

  def self.destroy_all
    @@all.clear
  end
  
end