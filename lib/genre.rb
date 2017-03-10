class Genre
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  extend Concerns::Nameable::ClassMethods
  include Concerns::Persistable::InstanceMethods

  attr_accessor :name, :songs

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    save
    @songs = []
  end

  def artists
    @songs.collect{|s| s.artist}.uniq
  end

end
