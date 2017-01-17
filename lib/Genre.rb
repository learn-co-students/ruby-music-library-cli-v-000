class Genre
  include Memorable::InstanceMethods
  extend Memorable::ClassMethods

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end


end
