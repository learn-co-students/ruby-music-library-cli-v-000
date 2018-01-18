class Genre
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    super
    @songs = []
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

  def self.all
    @@all
  end

end
