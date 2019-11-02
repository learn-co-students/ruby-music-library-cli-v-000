class Genre
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  extend Concerns::Nameable::ClassMethods
  include Concerns::Persistable::InstanceMethods

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def artists
    @songs.collect { |o| o.artist }.uniq
  end
end
