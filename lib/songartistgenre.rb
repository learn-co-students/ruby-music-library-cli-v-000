class Generic
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
    self.all
  end

  def self.create(name)
    newinstance = self.new(name)
    newinstance.save
    newinstance
  end


end
