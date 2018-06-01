
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
    song.instance_variable_set(:@artist, self) unless song.artist
    songs << song unless songs.include?(song)
  end
end