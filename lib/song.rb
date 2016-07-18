class Song
extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
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

  def self.create(name, artist = nil, genre = nil)
    Song.new(name).tap {|song| song.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
 

end