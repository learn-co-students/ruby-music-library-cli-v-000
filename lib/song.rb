class Song
  attr_accessor :name, :artist, :genre

  # CLASS VARIABLES AND METHODS
  @@all = Array.new

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  # INSTANCE VARIABLES AND METHODS
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if !(artist.nil?)
      self.artist=(artist)
    end

    if !(genre.nil?)
      self.genre=(genre)
    end
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
end
