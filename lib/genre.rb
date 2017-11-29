class Genre
@@all = []
attr_accessor :name, :songs
  def initialize(name)
    @songs = []
    self.name = name
  end
  def songs
    @songs
  end
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap do |name|
      name.save
    end
  end








end
