class Song
#==================modules=====================
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::Save
#=================properties===================
  attr_accessor :name, :artist, :genre
  # @@all = []
  def self.all; @@all end
  # come back to this to try to abstract away
#=================intialize====================
  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
#=================instance=====================
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
#==============================================
end
