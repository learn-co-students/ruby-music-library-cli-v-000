class Artist
  attr_accessor :songs
  attr_reader :name, :genre
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
  
  def new_song(name, genre)
    Song.new(name, self, genre)
  end
  
  def songs 
    Song.all.select{|something|something.artist==self}
  end

  def add_Artist()
    self.Artist << Artist
    song.artist = self
  end

  def genres
   songs.map { |s| s.genre }
  end
  
  def self.all 
    @@all
  end

end