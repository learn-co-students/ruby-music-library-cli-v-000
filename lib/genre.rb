class Genre
  attr_accessor :name, :songs
  @@all = []
  extend Concerns::Findable
  def initialize(name)
    @name = name
    @songs = []
  end
  def artists
    self.songs.map {|s| s.artist}.uniq
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all = []
  end
  def save
    @@all << self
  end
  def self.create(name)
    self.new(name).tap {|new_gen| new_gen.save}
  end
end
