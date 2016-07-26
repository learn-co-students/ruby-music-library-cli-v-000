class Genre < Song
  extend Concerns::Findable

  attr_accessor :songs

  def initialize(name)
    super
    @songs = []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre == self
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
end