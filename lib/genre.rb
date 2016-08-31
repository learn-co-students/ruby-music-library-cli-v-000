class Genre
  extend Concerns::Memorable::ClassMethods
  extend Concerns::Findable
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    super
    @songs = []
  end

  def self.all
    @@all
  end
end
