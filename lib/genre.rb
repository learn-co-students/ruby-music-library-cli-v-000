class Genre 
  extend Findable::ClassMethods
  # extend Persistable::ClassMethods
  # extend Nameable::ClassMethods
  # include Persistable::InstanceMethods
  attr_accessor :name, :artists, :songs
  # attr_reader :songs
  
  @@all = []
  
  def self.all
    @@all 
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new(name).tap {|genre| genre.save}
  end

  def artists
    songs.collect{ |s| s.artist }.uniq
  end
end
 