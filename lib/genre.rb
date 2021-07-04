class Genre
  extend Concerns::Memorable::ClassMethods
  extend Concerns::Findable
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    self.name = name
    self.songs = []
  end

  def artists
    songs.map { |song| song.artist }.to_set.to_a
  end
end
