class Song 


  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name, artist = nil, genre = nil)
   @name = name
   @artist = artist

  end
  
  def self.create(name)
    song = new(name)
    song.save
    song
  end
  
  def artist=(artist)
 
  end

  def genre=(genre)

  end
  
  def self.destroy_all
    all.clear
  end
  
  def save
    self.class.all << self
  end

  def self.new_from_filename(filename)
  end

  def self.create_from_filename(filename)
  end
end
  