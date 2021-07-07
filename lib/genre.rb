class Genre
  extend Concerns::Findable
  @@all=[]
  attr_accessor :name, :songs

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
  def save
    @@all << self
  end
  def self.create(name)
new(name).tap {|d|d.save}
end
def artists
songs.collect {|x|x.artist}.uniq
end
end
