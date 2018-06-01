
class Song
  extend Common::ClassMethods
  include Common::InstanceMethods

  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist = nil)
    self.name = name
    @artist = artist unless artist
  end

  def self.all
    @@all
  end
end
