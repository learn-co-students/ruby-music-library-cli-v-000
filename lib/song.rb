class Song
  @@all = []

  attr_accessor :name

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    #artist.songs << self
    artist.add_song(self)
  end

  def genre
    @genre
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

  def self.create(name)
    song = Song.new(name)
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
