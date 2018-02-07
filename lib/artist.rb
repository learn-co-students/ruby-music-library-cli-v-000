class Artist
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  def songs
    @songs
  end
  def add_song(song)
    binding.pry
    song.artist = nil ? song.artist = self :
    @songs.tap {|songs| songs << song}
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
  def self.create(name)
    self.new(name).tap {|new_art| new_art.save}
  end
end
