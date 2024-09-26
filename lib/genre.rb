class Genre
  extend Concerns::Findable
  extend Concerns::Nameable::ClassMethods
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def artists
    self.songs.collect { |song| song.artist }.uniq
  end

end
