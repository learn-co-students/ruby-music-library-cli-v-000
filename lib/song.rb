class Song 
  extend Concerns::Findable::ClassMethods
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def self.all
    @@all 
  end
  
 def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def self.create(name)
    new(name).tap {|artist| artist.save}
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end

  def self.new_from_filename(filename)
  end

  def self.create_from_filename(filename)
  end
end
  