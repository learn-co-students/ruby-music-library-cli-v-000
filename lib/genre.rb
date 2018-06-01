
class Genre
  extend Common::ClassMethods
  include Common::InstanceMethods

  attr_accessor :name
  @@all = []

  def initialize(name)
    self.name = name
  end

  def self.all
    @@all
  end
end