class Genre
  extend Concerns::Findable
  extend Persistable::ClassMethods
  extend Nameable::ClassMethods
  
  include Persistable::InstanceMethods
  
  attr_accessor :name
  attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def artists
    songs.collect{ |s| s.artist }.uniq
  end
end