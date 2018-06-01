
class Song
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
=begin
  def save
    self.class.all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    newy = self.new(name)
    newy.save
    newy
  end
=end
end
