class Genre
  @@all = []
  include Concerns::Findable
  attr_accessor :songs

  def self.all
    @@all
  end

  def initialize(name)
    super
  end

  def artists
    songs.collect { |song| song.artist }.uniq
  end

end
