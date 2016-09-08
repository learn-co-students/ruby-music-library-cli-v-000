class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_accessor :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
    self
  end

  def artists
    songs.collect do |song|
      song.artist
    end.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).save
  end
end

