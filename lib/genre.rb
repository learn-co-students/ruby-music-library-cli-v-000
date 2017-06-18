class Genre
  extend Concerns::Findable
  include Concerns::Persistable::InstanceMethods
  extend Concerns::Persistable::ClassMethods
  extend Concerns::Nameable::ClassMethods

  attr_accessor :name, :songs
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    @songs.collect{|s| s.artist}.uniq
  end

  end
