class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap{|s| s.save}
    # new_one = self.new(name)
    # self.all << new_one
    # new_one
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def artists
    self.songs.map{|song| song.artist}.uniq
  end
end
