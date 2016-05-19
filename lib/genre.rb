class Genre
  extend Concerns::Findable

  attr_accessor :songs

  def initialize(name)
    super
    @songs = []
  end

  def add_song(song)
    if song.genre == self
    else
      song.genre = self
    end  
    
    if @songs.include?(song) == true
    else
      @songs << song
    end
  end

  def artists
    artist = []
    self.songs.each do |tune|
      artist << tune.artist
    end
    artist.uniq
  end
end