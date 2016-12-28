class MusicModel
  extend Concerns::Findable

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def save
    self.class.all << self
    self
  end

  def self.create(name)
    instance = self.new(name)
    instance.save
    instance
  end


  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end
end
