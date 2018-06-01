
class Genre
  extend Common::ClassMethods, Concerns::Findable
  include Common::InstanceMethods

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    self.name = name
    self.songs = []
    save
  end

  def self.all
    @@all
  end
  
  def artists
    songs.collect { |song| song.artist }.uniq 
  end
end