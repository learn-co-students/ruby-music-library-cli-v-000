class Artist
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    super
    @songs = []
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

  def self.all
    @@all
  end

end
