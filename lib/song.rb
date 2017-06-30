class Song
  attr_accessor :name, :artist
  @@all = []
  def initialize(name, artist = nil)
    @name = name
    self.artist = artist
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

  def self.create(song_title)
    song = Song.new(song_title)
    @@all << song
    song
  end

  def artist=(artist)
    if artist.class == Artist
      @artist = artist
      artist.add_song(self)
    end
  end
end
