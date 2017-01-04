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
    self.all.clear
  end
  def save
    @@all << self
  end
  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end
  def artists
    self.songs.map{|object|object.artist}.uniq
  end
end
