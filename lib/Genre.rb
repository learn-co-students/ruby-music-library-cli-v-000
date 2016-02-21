class Genre
  extend Concerns::Findable
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

  def save
    @@all << self
  end

  def self.create(name)
    Genre.new(name).tap{|i| i.save}
  end

  def artists
    @songs.collect{|o| o.artist}.uniq
  end

  def to_s
    self.name
  end

end
