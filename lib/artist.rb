class Artist
  extend  Concerns::Creatable, Concerns::Findable
  include Concerns::Saveable

  @@all = []
  attr_accessor :name
  attr_reader   :songs

  def initialize(name)
    @name  = name
    @songs = []
  end

  def genres
    result = []
    @songs.each { |song| result << song.genre unless result.include?(song.genre) }
    result
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist != self
  end

  def self.all
    @@all
  end
end
