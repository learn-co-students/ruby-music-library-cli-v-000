
class Genre
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
end