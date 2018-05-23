class Genre
  attr_accessor :name
  attr_reader :songs

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new(name).tap {|g| g.save}
  end

  def artists
    songs.map {|s| s.artist}.uniq
  end

end
