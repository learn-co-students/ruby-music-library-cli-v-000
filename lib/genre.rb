class Genre
  extend Concerns::Findable #Take all of the methods in the findable module and add them as class methods
  extend Persistable::ClassMethods
  #extend Nameable::ClassMethods
  include Persistable::InstanceMethods

  attr_accessor :name, :songs

  @@all = []

  def self.all #class reader
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    @songs.collect{|s| s.artist}.uniq
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
end


end
