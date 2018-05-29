class Genre
  attr_reader :name, :songs

  def initialize(name)
    @name = name
    @songs = []
    @@all = []
  end

  def add_song(song)
    self.songs << songs
  end

  def artists
    songs.map { |s| s.artist }
  end
  
  def songs 
    Song.all.select{|something|something.genre==self}
  end
end