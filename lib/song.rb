class Song < Super

  attr_reader :artist

  def initialize(name, artist=nil)
    @name = name
    @artist = artist
  end

  def self.create(name)
    instance = Song.new(name)
    instance.save
    instance
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

end
