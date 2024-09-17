class Genre
  extend Concerns::Findable  #takes methods in module into class methods
  # extend Persistable::ClassMethods
  # extend Nameable::ClassMethods
  # include Persistable::InstanceMethods
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

  def self.create(genre)
    self.new(genre).tap {|genre| genre.save}
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

  

end
