class Genre
  extend  Concerns::Creatable, Concerns::Findable
  include Concerns::Saveable

  @@all = []
  attr_accessor :name
  attr_reader   :songs

  def initialize(name)
    @name  = name
    @songs = []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self if song.genre != self
  end

  def artists
    artists = []
    @songs.each { |song| artists << song.artist unless artists.include?(song.artist) }
    artists
  end

  def self.all
    @@all
  end
end
