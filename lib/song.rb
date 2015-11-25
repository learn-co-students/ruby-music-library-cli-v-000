class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist=nil)
    @name = name
    self.artist=(artist) unless artist == nil
    @@all << self
  end

  def self.all
    @@all 
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(string)
    new_song = Song.new(string)
  end

  def artist_name
    self.artist.name
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

 

end



####

