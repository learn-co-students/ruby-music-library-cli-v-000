class Artist
  @@all = []
  attr_accessor :name
  include Common::InstanceMethods
  extend Common::ClassMethods
  extend Concerns::Findable

  def initialize(name)
    super(name)
    @songs = []
  end

  def genres
    genres = @songs.collect { |song|
      song.genre
    }
    genres.uniq
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song if !@songs.include?(song)
  end

  def songs
    @songs
  end
end
