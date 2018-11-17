class Genre
  extend Concerns::Findable
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    super()
  end

  def self.all
    @@all
  end

  def artists
    @songs.collect{|s| s.artist}.uniq
  end

  def add_song(song)
  end

end
