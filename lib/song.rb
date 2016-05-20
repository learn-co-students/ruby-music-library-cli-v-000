class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=0, genre=0)
    @name = name
    artist.add_song(self) if artist != 0
    self.genre = genre if genre != 0 
    self.save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
   Song.new(name)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.detect{|s| s.genre == genre }
  end

end