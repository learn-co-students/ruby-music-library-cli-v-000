
class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  def self.all
    @@all.dup.freeze
  end
  def save
    @@all << self
    self
  end
  def self.destroy_all
    @@all.clear
  end
  def artists
    artist = []
    @songs.collect do |song|
      artist << song.artist
    end
    artist.uniq
  end
end
