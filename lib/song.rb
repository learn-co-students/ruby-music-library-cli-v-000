class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = "", genre = "")
    @name = name

    artist.add_song(self) unless artist == ""
    genre.add_song(self) unless genre == ""
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
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

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
end
