class Genre
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  attr_accessor :name
  @@all=[]

  def initialize(name)
    @name=name
    @genres=[]
  end

  def self.all
    @@all
  end

  def self.create(name)
    self.new(name).save
    self
  end

end
