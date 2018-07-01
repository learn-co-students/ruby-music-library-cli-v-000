class Genre 
  extend Concerns::Findable::ClassMethods
  attr_accessor :name, :artists, :songs
  
  @@all = []
  
  def self.all
    @@all 
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end

  def self.create(name)
    new(name).tap {|genre| genre.save}
  end

  def artists
    songs.collect{ |s| s.artist }.uniq
  end
end
 