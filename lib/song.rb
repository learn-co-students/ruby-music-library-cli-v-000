
class Song
  extend Common::ClassMethods
  include Common::InstanceMethods

  attr_accessor :name
  attr_reader :artist
  @@all = []

  def initialize(name, artist = nil)
    self.name = name
    self.artist = artist unless artist == nil
  end

  def self.all
    @@all
  end
  
  def artist=(artist)
    artist.add_song(self) if self.artist == nil
  end
end
