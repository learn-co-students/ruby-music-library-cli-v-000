class Song 
  extend Findable
  # extend Persistable::ClassMethods
  # extend Nameable::ClassMethods
  # include Persistable::InstanceMethods
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def self.all
    @@all 
  end
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist 
    self.genre = genre
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

end
  