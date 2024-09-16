class Genre

  extend Concerns::Findable

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
    @@all << self
    self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).save
  end

  def songs
    @songs
  end

  def artists
    artist = self.songs.collect do |song|
      song.artist
    end
    artist.uniq
  end

end
