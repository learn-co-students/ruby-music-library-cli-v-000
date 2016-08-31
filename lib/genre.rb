class Genre
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def artists
    self.songs.collect {|s| s.artist}.uniq
  end

  def to_s
    self.name
  end
end
