class Genre

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artists

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    name = self.new(name)
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def artists=
    @artists
  end

  def artists
    songs.collect do |s|
      s.artist
    end.uniq
  end

end
