class Genre
  extend Concerns::Findable

  attr_reader :name
  
  @@all = []

  def initialize(name)
    self.name=(name)
    @songs = []
  end

  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new(name).tap{|g| g.save}
  end

  def songs
    @songs
  end

  def artists
    songs.collect{|s| s.artist}.uniq
  end
end
