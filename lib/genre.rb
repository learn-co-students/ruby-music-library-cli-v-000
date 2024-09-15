class Genre
  extend Concerns::Findable
  include Concerns::Savable

  @@all = []

  def self.all
    @@all
  end
  attr_accessor :songs, :name

  def initialize(name)
    super(name)
    self.save unless Genre.all.map{|g| g.name}.include?(name)
    @songs = []
  end

  def artists
    self.songs.map{|song| song.artist }.uniq
  end

end
