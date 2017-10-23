class Genre
  extend Concerns::Findable
  extend Concerns::Createdestroy
  include Concerns::Save
  attr_accessor :name, :songs, :artists

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end
end
