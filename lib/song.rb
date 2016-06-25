require 'pry'

class Song
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  attr_accessor :name

  @@all = []

  def initialize name
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create name
    self.new(name).save
  end

  def self.destroy_all
    self.all.clear
  end

end


