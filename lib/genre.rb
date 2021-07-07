class Genre
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all= []

  def self.all
    @@all
  end

  def initialize(name)
    super
    self.songs = []
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
end
