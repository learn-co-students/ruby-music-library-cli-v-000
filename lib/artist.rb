
class Artist
  extend Common::ClassMethods
  include Common::InstanceMethods

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    self.name = name
    self.songs = []
  end

  def self.all
    @@all
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    self.class.all << song unless self.class.all.include? song
  end
end