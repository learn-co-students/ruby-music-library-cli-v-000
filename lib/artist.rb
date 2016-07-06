require 'pry'

class Artist

  attr_accessor :name

  extend Findable::ClassMethods
  extend Persistable::ClassMethods
  extend Memorable::ClassMethods
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  include Nameable::InstanceMethods

  def initialize(name)
    @name = name
    save
    @songs = []
  end

  def self.create(name)
    new(name).tap{|s| s.save}
  end

  @@all = []

  def self.all
    @@all
  end

end
