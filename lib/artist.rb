class Artist
  @@all=[]
  attr_accessor :name
  attr_reader :songs
  def initialize(name)
    @songs=[]
    @name=name
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
  def self.create(artist)
    artist= Artist.new(artist)
    artist.save
    artist
  end
end