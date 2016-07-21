class Song
  @@all = []
  attr_accessor :name, :artist, :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    genre.song = self
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    # self.new(name).tap {|s| s.save}
    song = self.new(name)
    song.save
  end

  def artist=(artist)
    artist.add_song(song)
  end

end
