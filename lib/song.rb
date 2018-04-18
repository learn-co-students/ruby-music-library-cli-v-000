require_relative "./music_module.rb"

class Song
  extend Music::C_Methods
  include Music::I_Methods

  attr_reader :artist

  @@all = []

  def initialize(name, artist = nil)
    super(name)

    artist = artist if !!artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

end
