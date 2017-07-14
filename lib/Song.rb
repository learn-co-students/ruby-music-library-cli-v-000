class Song

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
    @@all << self
  end

  attr_accessor :name
  attr_reader :artist, :genre

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
  end
end
