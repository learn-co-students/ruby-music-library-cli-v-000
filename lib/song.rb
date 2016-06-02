class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  #class methods
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end
  def self.all
    @@all
  end
  def self.destroy_all
    self.all.clear
  end
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end


  #instance methods
  def save
    self.class.all << self
  end
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end
  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end
end
