class Song

  attr_accessor :name

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.genre = genre if genre
    @name = name
    self.artist = artist if artist
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

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def artist
    @artist
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

end
