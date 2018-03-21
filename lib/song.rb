class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist
    self.genre = genre
    self.save
  end

  def artist=(artist)
    @artist = artist if artist
    @artist.add_song(self) if artist
  end

  def genre=(genre)
    @genre = genre if genre
    @genre.add_song(self) if genre
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

  def self.create(name)
    self.new(name)
  end
end
