class Genre
  extend Concerns::Findable

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
    self.all.clear
  end

  def save
    Genre.all << self
  end

  def self.create(name)
    Genre.new(name).tap{|genre| genre.save}
  end

  def artists
    self.songs.collect{|s| s.artist}.uniq
  end
end
