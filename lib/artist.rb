
class Artist
  attr_accessor :name, :songs, :genres 

  extend Concerns::Findable

  @@all = [] 

  def initialize(name)
    @name = name 
    @@all << self 
    @songs = []
    @all_genres = []
  end

  def Artist.all 
    @@all 
  end

  def genres
    @all_genres 
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
    self.songs << song unless self.songs.include?(song) 
    song.artist = self if song.artist.nil?
  end

end