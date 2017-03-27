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

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    @songs << song
  end

  def self.create(name)
    new(name).tap{|o| o.save}
  end

  def artists
    self.songs.map{|s| s.artist}.uniq if self.songs.size > 1
  end
end
