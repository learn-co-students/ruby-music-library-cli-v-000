class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all =[]

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def name=(name)
    @name = name
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
    Genre.new(name)
  end

  def artists
    self.songs.collect{|s| s.artist}.uniq
  end

  def to_s
    @name
  end 

end
