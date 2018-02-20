class Genre
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    Genre.all << self
  end

  def self.create(name)
    Genre.new(name).tap {|s| s.save}
  end

  def artists
    @songs.collect{|s| s.artist}.uniq
  end

end
