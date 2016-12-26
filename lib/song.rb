class Song
  attr_accessor :name, :artist
  @@all = []
  def initialize(name)
    @artist = artist
    @name = name
  end
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end
