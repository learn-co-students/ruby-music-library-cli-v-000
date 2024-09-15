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

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    g = self.new(name)
    g.save
    g
  end

  def artists
    a = []
    self.songs.each do |song|
      a << song.artist
    end
    a.uniq
  end

  def self.find_by_name(name)
    @@all.detect do |g|
      g.name == name
    end
  end



end


