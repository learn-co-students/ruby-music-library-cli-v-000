class Artist
  include Concerns::Findable
  extend Concerns::Findable

  attr_accessor :songs

  def initialize(name)
    super
    @songs = []
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    genres = []
    self.songs.each do |tune|
      genres << tune.genre unless genres.include?(tune.genre)
    end
    genres
  end

end