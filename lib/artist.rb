
class Artist
  attr_accessor :name
  attr_reader :songs 

  @@all = [] 

  def initialize(name)
    @name = name 
    @@all << self 
    @songs = []
  end



  def Artist.all 
    @@all 
  end

  def Artist.destroy_all 
    Artist.all.clear 
  end

  def save 
    @@all
  end

  def Artist.create(artist)
    item = Artist.new(artist)
  end

  def add_song(song)
    self.songs << song if Artist.all.include?(song) 
    song.artist = self if song.artist.nil?
  end

end