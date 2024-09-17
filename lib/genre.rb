class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs=[]
  end

  def artists
    self.songs.map{|song| song.artist}.uniq
  end

  def save
    @@all << self
  end

  def self.create(name)
    new(name).tap{|x| x.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
