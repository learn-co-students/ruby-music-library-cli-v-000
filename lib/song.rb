class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []


  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
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
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    if artist.class == Artist
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if genre.class == Genre
      @genre = genre
      genre.add_song(self)
    end
  end

end
