class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  extend Concerns::Findable

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    if artist != nil then self.artist=(artist)
    end
    if genre != nil then self.genre=(genre)
    end
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
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
end
