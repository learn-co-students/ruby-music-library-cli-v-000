class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def add_song(song)
    @songs << song
  end

  def self.create(name)
    new(name).tap{|a| a.save}
  end

  def artists
    @songs.collect{|s| s.artist}.uniq
  end

end
