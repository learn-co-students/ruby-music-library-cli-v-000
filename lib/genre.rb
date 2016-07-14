class Genre
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
  attr_accessor :name, :artist, :song
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.create(name)
    new(name).tap{|s| s.save}
  end

end
