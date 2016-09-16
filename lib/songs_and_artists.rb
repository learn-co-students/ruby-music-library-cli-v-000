class SongsAndArtists
 
  attr_accessor :songs, :artist

  def initialize(name)
    @songs = []
    @name = name
  end 

  def songs
    @songs
  end  

  def add_song(song)
    @songs << song
    song.artist = self
  end

end