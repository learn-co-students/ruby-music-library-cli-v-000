class Genre
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods

  attr_accessor :name
  @@all = []

  def self.all
    @@all
  end

end
