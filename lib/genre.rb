class Genre

  attr_accessor :name, :songs
  @@all = []


  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new(name).tap {|n| n.save}
  end

  def save
    @@all << self
  end




end
