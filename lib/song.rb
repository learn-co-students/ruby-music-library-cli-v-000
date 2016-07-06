class Song

  attr_accessor :name
  attr_reader :genre

  extend Findable::ClassMethods
  extend Persistable::ClassMethods
  extend Memorable::ClassMethods
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  include Nameable::InstanceMethods

  @@all = []

def genre=(genre)
  genre.songs << self unless genre.songs.include?(self)
  @genre = genre
end

  def initialize(name)
    @name = name
    save
  end

  def self.all
    @@all
  end

  def self.create(name)
    new(name).tap{|s| s.save}
  end



end
