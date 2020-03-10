class Genre
  extend Concerns::Findable
  attr_accessor :name, :artist, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap{|a| a.save}
  end

  def self.all
    @@all
    end

    def to_s
      self.name
    end

  def self.destroy_all
    @@all.clear
  end

  def artists
    self.songs.collect{|s| s.artist}.uniq
  end

  def to_s
    self.name
  end

  def save
    @@all << self
 end
end
