class Genre
  
  attr_accessor :name, :artist, :song
  
  @@all =[]
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def songs
    Song.all.select { |song| song.genre == self }
  end
  
  def artists
    artists = []
    self.songs.map { |song| 
    artists << song.artist
    }
    artists
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.create(genre)
    genre = self.new(genre)
  end
end