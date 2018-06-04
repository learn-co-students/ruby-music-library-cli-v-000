
class Genre
  extend Common::ClassMethods, Concerns::Findable
  include Common::InstanceMethods

  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    self.name = name
    @songs = []
  end

  def self.all
    @@all
  end
  
  def artists
    songs.collect { |song| song.artist }.uniq 
  end
end