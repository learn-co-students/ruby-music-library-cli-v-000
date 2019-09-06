class Genre
  extend Concerns::Findable
  include Concerns::Saveable

  attr_accessor :name, :song, :songs

  @@all = []

  def initialize (name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def artists
    @songs.collect{|song|song.artist}.uniq
  end

  def self.all
    @@all
  end
end
