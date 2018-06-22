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
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    self.new(name).tap { |x|
      x.save
    }
  end

  def artists
    songs.map { |x|
      x.artist
    }.uniq
  end
end
