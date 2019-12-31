class Genre
  attr_accessor :name
  attr_reader :songs

  extend Concerns::Findable
  
  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    Genre.new(name).tap { |g| g.save }
  end

  def artists
    self.songs.collect {|s| s.artist}.uniq
  end

end
