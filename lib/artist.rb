class Artist
  extend Concerns::Findable
  attr_accessor :name, :song, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end
  def self.find(name)
    self.all.detect{|artist| artist.name == name}
  end
  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end
end
