require_relative "./music_module.rb"

class Song
  extend Music::C_Methods
  include Music::I_Methods

  attr_reader :artist, :genre

  @@all = []

  def self.find_by_name(name)
    rtn = @@all.detect { |e| e.name == name}
    rtn
  end

  def initialize(name, artist = nil, genre = nil)
    super(name)

    self.genre = genre if !! genre
    self.artist = artist if !!artist
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
