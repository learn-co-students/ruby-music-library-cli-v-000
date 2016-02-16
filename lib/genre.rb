
class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all=[]
  def initialize(name)
    @name=name
    @songs=[]
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    self.new(name).save
    self
  end

  def save
    @@all<<self
  end

  

  def artists
    a=@songs.collect do |song|
      song.artist
    end
    a.uniq
  end
end