class Genre
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all = []
  end
  def save
    @@all << self
  end
  def self.create(name)
    self.new(name).tap {|new_gen| new_gen.save}
  end
end
