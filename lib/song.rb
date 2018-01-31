class Song
  attr_accessor :name, :artist, :genre
  attr_reader :artist
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if @artist != nil
    @genre = genre
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(song_name)
    song = Song.new(song_name)
    song.save
    song
  end

  def artist=(artist)
    self.artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    self.genre = genre
    genre.add_song(self)
  end
end
