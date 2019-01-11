class Genre
  
  attr_accessor :name, :artist, :song
  
  extend Concerns::Findable

  @@all =[]
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end

  def songs
    # Song.all.select { |song| song.genre == self }
    @songs
  end
  
  def artists
    artists = []
    self.songs.map { |song| 
    artists << song.artist
    }
    artists.uniq
  end

  def self.destroy_all
    @@all = []
  end
  
  def self.create(genreName)
    genre = self.new(genreName)
    genre.save
    genre
  end
  
  def self.find_by_name(objectName)
      self.all.find {|object| object.name == objectName }
  end
  
  
  def self.find_or_create_by_name(objectName)
    self.find_by_name(objectName) ? self.find_by_name(objectName) : self.create(objectName)
  end

end