class Song
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name, artist= nil, genre= nil)
  @name = name
  self.genre= genre if genre!=nil
  self.artist= artist if artist!=nil
  end

  def self.all 
    @@all
  end

  def self.destroy_all
     self.all.clear
  end
  
  def save
    @@all << self
  end

  def self.create(song)
    s = Song.new(song)
    s.save
    s
  end
  
 def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre
    @genre
  end
  
   def genre= (genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

end


