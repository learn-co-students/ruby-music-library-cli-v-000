class Songs_And_Artists

attr_accessor :songs, :song, :artist

def initialize(song, artist=nil)
  @song = song 
  @artist = artist
  @songs = []
end

def songs
  @songs 
end 

end