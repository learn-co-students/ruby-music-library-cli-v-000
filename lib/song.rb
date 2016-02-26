class Song
  extend Concerns::Findable
  attr_accessor :name
  @@all = []
  def initialize(name, artist = "", genre = "")
    self.name = name
    self.artist = artist
    self.genre = genre
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
    song = self.new(name)
    song.save
    song
  end
  def artist
    @artist
  end
  def artist=(artist)
    @artist = artist
    artist.add_song(self) if artist != ""
  end
  def genre
    @genre
  end
  def genre=(genre)
    @genre = genre
    genre.songs << self if genre != "" && !genre.songs.include?(self)
  end
end