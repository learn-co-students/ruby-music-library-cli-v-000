class Song
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
    @@all << self
  end

  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
  def add_song
    self.artist.add_song
  end
  
  def self.find_by_name(name)
    all.detect { |s| s.name == name }
  end
  
  def self.create(name)
    new(name).tap { |s| s.save }
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
  
end
