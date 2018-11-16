class Song

extend Concerns::Findable

attr_accessor :name
attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.genre=(genre) if genre
    self.artist=(artist) if artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_genre(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    instance = self.new(name)
    instance.save
    instance
  end
end
