class Genre

  attr_accessor :name, :songs
  @@all = []
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
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
    self.new(name)
  end

  def songs
    @songs
  end

  def add_song(name)
    @songs << name
  end

  def artists
    x = songs.collect {|genre| genre.artist}
    x.uniq
  end
end
