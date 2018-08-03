

class Genre

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    v = self.new(name)
    v.save
    v
  end

  def songs
    @songs
  end

  def artists
    ary = self.songs.collect do |song|
      song.artist
    end
    ary.uniq
  end

end
