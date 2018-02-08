class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []
  def initialize(name, art = nil, gen = nil)
    @name = name
    art == nil ? @artist = art : self.artist=(art)
    gen == nil ? @genre = gen : self.genre=(gen)
  end
  def genre=(gen)
    @genre = gen
    gen.songs.tap {|g| g << self if !g.include?(self)}
  end
  def artist=(art)
    @artist = art
    @artist.add_song(self)
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all = []
  end
  def save
    @@all << self
  end
end
